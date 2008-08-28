class Journal < ActiveRecord::Base
  has_many :articles
  has_many :journal_stats, :order => "`journal_stats`.year"
  has_many :authors, :class_name => "AuthorJournal", :include => :author
  has_many :author_journal_years
  has_many :genes, :class_name => "JournalGene", :include => :gene
  has_many :journal_gene_years
  has_many :subjects, :class_name => "JournalSubject", :include => :subject
  has_many :journal_subject_years
  has_many :pubtypes, :class_name => "JournalPubtype", :include => :pubtype
  has_many :journal_pubtype_years

  def self.search(query, options = {})
    options[:conditions] = ["#{options[:conditions]} AND #{Journal.table_name}.abbr LIKE ?", "#{query}%"] unless query.blank? || query.length > 1 # for alphabetical list
    options[:conditions] ||= ["#{Journal.table_name}.title LIKE ?", "%#{query}%"] unless query.blank? || query.length <= 1 # for full name
    options[:page]      ||= 1
    options[:per_page]  ||= 24
    paginate options
  end

  def to_s
    abbr
  end
end
