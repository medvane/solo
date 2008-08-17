class Journal < ActiveRecord::Base
  has_many :articles
  has_many :journal_stats
  has_many :author_journals
  has_many :authors, :through => :author_journals
  has_many :journal_genes
  has_many :genes, :through => :journal_genes
  has_many :journal_subjects
  has_many :subjects, :through => :journal_subjects

  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options
  end

  def to_s
    abbr
  end
end
