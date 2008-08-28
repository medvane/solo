class Author < ActiveRecord::Base
  has_many :authorships
  has_many :articles, :through => :authorships
  has_many :author_stats, :order => "`author_stats`.year"
  has_many :coauthors, :class_name => "Coauthorship", :include => :coauthor
  has_many :coauthorship_years
  has_many :journals, :class_name => "AuthorJournal", :include => :journal
  has_many :author_journal_years
  has_many :subjects, :class_name => "AuthorSubject", :include => :subject
  has_many :author_subject_years
  has_many :genes, :class_name => "AuthorGene", :include => :gene
  has_many :author_gene_years
  has_many :pubtypes, :class_name => "AuthorPubtype", :include => :pubtype
  has_many :author_pubtype_years

  def self.search(query, options = {})
    options[:conditions] = ["#{options[:conditions]} AND #{Author.table_name}.last_name LIKE ?", "#{query}%"] unless query.blank? || query.length > 1 # for alphabetical list
    options[:page]      ||= 1
    options[:per_page]  ||= 24
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
