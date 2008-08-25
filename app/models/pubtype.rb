class Pubtype < ActiveRecord::Base
  has_many :article_types
  has_many :articles, :through => :article_types
  has_many :pubtype_stats, :order => "`pubtype_stats`.year"
  has_many :pubtype_authors, :class_name => "AuthorPubtype"
  has_many :authors, :through => :pubtype_authors
  has_many :author_pubtype_years
  has_many :pubtype_journals, :class_name => "JournalPubtype"
  has_many :journals, :through => :pubtype_journals
  has_many :journal_pubtype_years

  def self.total_entries(period = 'all')
    cache_key = period + '_cached'
    Rails.cache.fetch(cache_key) { count('id', :conditions => "`#{period}` > 0") }
  end

  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 40
    paginate options
  end

  def to_s
    title
  end
end
