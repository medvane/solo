class Subject < ActiveRecord::Base
  has_many :topics
  has_many :articles, :through => :topics
  has_many :subject_stats, :order => "`subject_stats`.year"
  has_many :subject_authors, :class_name => "AuthorSubject"
  has_many :authors, :through => :subject_authors
  has_many :author_subject_years
  has_many :subject_journals, :class_name => "JournalSubject"
  has_many :journals, :through => :subject_journals
  has_many :journal_subject_years
  has_many :subject_genes
  has_many :genes, :through => :subject_genes
  has_many :subject_gene_years

  def self.total_entries(period = 'all')
    cache_key = period + '_major_cached'
    Rails.cache.fetch(cache_key) { count('id', :conditions => "`#{period}_major` > 0") }
  end

  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 40
    options[:order]     ||= SUBJECT_ORDER['all']
    paginate options
  end

  def to_s
    term
  end
end
