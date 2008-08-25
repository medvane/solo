class Journal < ActiveRecord::Base
  has_many :articles
  has_many :journal_stats, :order => "`journal_stats`.year"
  has_many :journal_authors, :class_name => "AuthorJournal"
  has_many :authors, :through => :journal_authors
  has_many :author_journal_years
  has_many :journal_genes
  has_many :genes, :through => :journal_genes
  has_many :journal_gene_years
  has_many :journal_subjects
  has_many :subjects, :through => :journal_subjects
  has_many :journal_subject_years
  has_many :journal_pubtypes
  has_many :pubtypes, :through => :journal_pubtypes
  has_many :journal_pubtype_years

  def self.search(query, options = {})
    options[:conditions] ||= ["#{Journal.table_name}.title LIKE ?", "#{query}%"] unless query.blank? || query.length > 1 # for alphabetical list
    options[:conditions] ||= ["#{Journal.table_name}.title LIKE ?", "%#{query}%"] unless query.blank? || query.length <= 1 # for full name
    options[:page]      ||= 1
    options[:per_page]  ||= 40
    paginate options
  end

  def to_s
    abbr
  end
end
