require 'zlib'
require 'open-uri'

ONE_YEAR_IN_SECONDS   = 365 * 24 * 60 * 60
FIVE_YEARS_IN_SECONDS = 5 * ONE_YEAR_IN_SECONDS
TEN_YEARS_IN_SECONDS  = 10 * ONE_YEAR_IN_SECONDS
FILES = ["journals", "articles", "authors", "subjects", "pubtypes", "genes", "coauthorships", "author_journals", "author_subjects", "author_genes", "author_pubtypes", "journal_subjects", "subject_genes", "journal_pubtypes", "journal_genes", "authorships", "article_types", "topics", "published_genes"]
namespace :mdvn do
  desc "Update bibliome with PubMed search term in config/medvane.yml"
  task :update => :environment do
    eutils = Eutils.new("medvane", "joon@medvane.org")
    search_term = MEDVANE_CONFIG["pubmed_search_term"]
    progress("Searching PubMed: #{search_term}")
    esearch = eutils.esearch(search_term, "pubmed", "sort" => "pub date")
    count = esearch["Count"].to_i
    progress("#{count} found in PubMed")
    # fetch only PMID for gene2pubmed
    # gene_ids from ftp://ftp.ncbi.nih.gov/gene/DATA/gene2pubmed.gz
    # gene info
    retmax = 500
    author_id = authors()
    last_author_id = author_id.values.max
    journal_id = journals()
    subject_id = subjects()
    require 'pp'
    require 'medline'
    0.step(count, retmax) do |retstart|
      progress("Downloading articles: #{retstart + 1}-#{retstart + retmax}")
      efetch = eutils.efetch("pubmed", esearch["WebEnv"], esearch["QueryKey"], {"retstart" => retstart, "retmax" => retmax, "rettype" => "medline", "retmode" => "text"})
      medlines = efetch.split(/\n\n/)
      progress("Processing articles: #{retstart + 1}-#{retstart + medlines.size}")
      data = []
      medlines.each do |e|
        m = Bio::MEDLINE.new(e)
        journal = journal_id[m.ta]
        authors = m.authors.map {|a| [a['last_name'].upcase, a['fore_name'].upcase, a['initials'].upcase, a['suffix'].upcase].join("|")}.map {|a| author_id[a] ||= (last_author_id += 1)}
        subjects = m.major_descriptors.map {|t| subject_id[t]}
        genes = []
        pubtypes = m.pt.map {|p| subject_id[p.gsub(/JOURNAL ARTICLE/, "Journal Article")]}
        pubdate = m.pubdate
        pubyear = pubdate.to_time.year
        periods = periods(pubdate)
        # articles
        data << ["articles", m.pmid, journal, m.volume, m.issue, m.pg, pubdate, m.dp, m.title, m.vernacular_title, m.abstract, m.pubmed['AD'].strip]
        periods.each do |period|
          # journals
          data << ["journals", journal, period]
          authors.each do |author|
            position = position_name(authors.rindex(author) + 1, authors.size)
            # authors
            data << ["authors", author, period, position]
            # coauthorships
            authors.reject {|a| a == author}.each do |coauthor|
              cposition = position_name(authors.rindex(coauthor) + 1, authors.size)
              data << ["coauthorships", author, coauthor, period, cposition]
            end
            # author_journals
            data << ["author_journals", author, journal, period, position]
            # author_subjects
            subjects.each do |subject|
              data << ["author_subjects", author, subject, period, position]
            end
            # author_genes
            genes.each do |gene|
              data << ["author_genes", author, gene, period, position]
            end
            # author_pubtypes
            pubtypes.each do |pubtype|
              data << ["author_pubtypes", author, pubtype, period, position]
            end
          end
          subjects.each do |subject|
            # subjects
            data << ["subjects", subject, period]
            # journal_subjects
            data << ["journal_subjects", journal, subject, period]
            # subject_genes
            genes.each do |gene|
              data << ["subject_genes", subject, gene, period]
            end
          end
          pubtypes.each do |pubtype|
            # pubtypes
            data << ["pubtypes", pubtype, period]
            # journal_pubtypes
            data << ["journal_pubtypes", journal, pubtype, period]
          end
          # journal_genes
          genes.each do |gene|
            # genes
            data << ["genes", gene, period]
            data << ["journal_genes", journal, gene, period]
          end
        end
        authors.each do |author|
          # authorships
          data << ["authorships", m.pmid, authors.rindex(author) + 1, authors.size, author, 1]
        end
        subjects.each do |subject|
          # topics
          data << ["topics", m.pmid, subject, 1]
        end
        pubtypes.each do |pubtype|
          # article_types
          data << ["article_types", m.pmid, pubtype]
        end
        genes.each do |gene|
          # published_genes
          data << ["published_genes", gene, m.pmid]
        end
      end
      # process
      write_to_files(data, retstart)
    end
    load_to_db()
    # clean up files in tmp
  end

  desc "Load data in db/dat/*.dat into MySQL database"
  task :load_data => :environment do
    total_size = 0
    Dir.glob(File.join(Rails.root, "db", "dat", "*.dat")) do |file|
      table_name = File.basename(file, ".dat")
      quoted_table_name = quote_table_name(table_name)
      file_size = File.size(file)
      total_size += file_size
      if file_size > 0
        progress("Loading #{file_size} byte data into #{table_name}")
        execute("ALTER TABLE #{quoted_table_name} ENGINE = MyISAM")
        execute("TRUNCATE TABLE #{quoted_table_name}")
        execute("ALTER TABLE #{quoted_table_name} DISABLE KEYS")
        execute("LOAD DATA LOCAL INFILE '#{file}' INTO TABLE #{quoted_table_name}")
        progress("adding index to #{quoted_table_name}")
        execute("ALTER TABLE #{quoted_table_name} ENABLE KEYS")
      end
    end
    puts "[#{Time.now.to_s}] #{total_size} byte data loaded"
  end

  def authors
    progress("Retrieving current authors")
    author_id = {}
    Author.find_each do |author|
      key = [author.last_name, author.fore_name, author.initials, author.suffix].join("|")
      author_id[key] = author.id
    end
    progress("Current authors: #{author_id.keys.size}")
    return author_id
  end

  def journals
    url = "ftp://ftp.ncbi.nih.gov/pubmed/J_Entrez.gz"
    progress("Downloading #{url}")
    journal_id = {}
    value = {}
    file = tempfile("journals.txt")
    File.open(file, "w") do |f|
      gz = download_gz(url)
      gz.each_line do |line|
        key, val = line.strip.split(/: /, 2)
        value[key] = val
        if key == 'NlmId'
          journal_id[value['MedAbbr']] = value['JrId']
          f.write([value['JrId'], value['JournalTitle'], value['MedAbbr'], value['ISSN'], value['ESSN'], value['NlmId']].join("\t") + "\n")
        end
      end
    end
    progress("Downloaded #{journal_id.keys.size} journals")
    return journal_id
  end

  def subjects
    year = Time.now.year
    subjects = {}
    progress("Downloading d#{year}.bin")
    file = tempfile("subjects")
    open("ftp://nlmpubs.nlm.nih.gov/online/mesh/.asciimesh/d#{year}.bin") do |f|
      id, term = nil, nil
      f.each_line do |line|
        tag, val = line.strip.split(/ = /, 2)
        case tag
          when "*NEWRECORD" then id, term = nil, nil
          when "MH" then term = val
          when "UI" then id = val.gsub(/^D0*/, "")
          when nil then subjects[term] = id
        end
      end
    end
    return subjects
  end

  def position_name(position, last_position)
    if position == 1
      return "first"
    elsif position > 1 && position == last_position
      return "last"
    else
      return "middle"
    end
  end

  def periods(pubdate)
    article_age = (Time.now.to_time - pubdate.to_time).round
    article_age = 0 if article_age < 0
    periods = [pubdate[0, 4], "all"]
    periods.push("one")   if article_age <= ONE_YEAR_IN_SECONDS
    periods.push("five")  if article_age <= FIVE_YEARS_IN_SECONDS
    periods.push("ten")   if article_age <= TEN_YEARS_IN_SECONDS
    return periods
  end

  def write_to_files(data, retstart)
    mode = retstart == 0 ? "w" : "a"
    fh = {}
    FILES.each do |filename|
      fh[filename] = File.open(tempfile(filename), mode)
    end
    data.each do |d|
      filename = d.shift
      fh[filename].write(d.join("\t") + "\n")
    end
    fh.values.each do |h|
      h.close
    end
  end

  def tempfile(file_name)
      File.join(Rails.root, "tmp", file_name)
  end

  def execute(sql)
    ActiveRecord::Base.connection.execute(sql)
  end

  def quote_table_name(table_name)
    ActiveRecord::Base.connection.quote_table_name(table_name)
  end

  def progress(message)
    puts "[#{Time.now.to_s}] #{message}"
  end

  def download_gz(url)
    Zlib::GzipReader.new(open(url))
  end

  def dbadapter
    YAML::load(ERB.new(IO.read("#{Rails.root}/config/database.yml")).result)[Rails.env]['adapter']
  end

  def open_tmp(filename)
    tmpfile = tempfile(filename)
    File.open(tmpfile, "r") do |file|
      progress("Reading #{tmpfile}")
      file.each_line do |line|
        arry = line.strip.split(/\t/)
        yield arry
      end
    end
  end

  def load_to_db
    progress("loading data to db")
    # http://wiki.github.com/zdennis/activerecord-import/examples
    require "activerecord-import/#{dbadapter}"
    load_journals()
    load_articles()
    load_authors()
    load_subjects()
    load_pubtypes()
    load_genes()
    load_coauthorships()
    load_author_journals()
    load_author_subjects()
    load_author_genes()
    load_author_pubtypes()
    load_journal_subjects()
    load_subject_genes()
    load_journal_pubtypes()
    load_journal_genes()
    load_authorships()
    load_article_types()
    load_topics()
    load_published_genes()    
  end

  def load_journals
    open_tmp("journals") do |line|
      puts line
    end
  end 

  def load_articles
    open_tmp("articles") do |line|
    end
  end 

  def load_authors
    open_tmp("authors") do |line|
    end
  end 

  def load_subjects
    open_tmp("subjects") do |line|
    end
  end 

  def load_pubtypes
    open_tmp("pubtypes") do |line|
    end
  end 

  def load_genes
    open_tmp("genes") do |line|
    end
  end 

  def load_coauthorships
    open_tmp("coauthorships") do |line|
    end
  end

  def load_author_journals
    open_tmp("author_journals") do |line|
    end
  end

  def load_author_subjects
    open_tmp("author_subjects") do |line|
    end
  end

  def load_author_genes
    open_tmp("author_genes") do |line|
    end
  end

  def load_author_pubtypes
    open_tmp("author_pubtypes") do |line|
    end
  end

  def load_journal_subjects
    open_tmp("journal_subjects") do |line|
    end
  end

  def load_subject_genes
    open_tmp("subject_genes") do |line|
    end
  end

  def load_journal_pubtypes
    open_tmp("journal_pubtypes") do |line|
    end
  end

  def load_journal_genes
    open_tmp("journal_genes") do |line|
    end
  end

  def load_authorships
    open_tmp("authorships") do |line|
    end
  end

  def load_article_types
    open_tmp("article_types") do |line|
    end
  end

  def load_topics
    open_tmp("topics") do |line|
    end
  end

  def load_published_genes
    open_tmp("published_genes") do |line|
    end
  end
end
