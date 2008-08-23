class Author < ActiveRecord::Base
  has_many :authorships
  has_many :articles, :through => :authorships
  has_many :author_stats
  has_many :coauthorships, :include => :coauthor, :order => "coauthorships.all_total desc, coauthorships.all_first desc, coauthorships.all_last desc, coauthorships.all_middle desc, authors.last_name"
  has_many :coauthorship_years
  has_many :author_journals
  has_many :journals, :through => :author_journals
  has_many :author_journal_years
  has_many :author_subjects
  has_many :subjects, :through => :author_subjects
  has_many :author_subject_years
  has_many :author_genes
  has_many :genes, :through => :author_genes
  has_many :author_gene_years
  has_many :author_pubtypes
  has_many :pubtypes, :through => :author_pubtypes
  has_many :author_pubtype_years

  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 40
    options[:order] ||= AUTHOR_ORDER['all']
    paginate options
  end

  def to_s
    if collective_name.empty?
      "#{last_name}, #{fore_name}"
    else
      collective_name
    end
  end
end
