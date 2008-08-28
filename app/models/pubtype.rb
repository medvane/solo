class Pubtype < ActiveRecord::Base
  has_many :article_types
  has_many :articles, :through => :article_types
  has_many :pubtype_stats, :order => "`pubtype_stats`.year"
  has_many :authors, :class_name => "AuthorPubtype", :include => :author
  has_many :author_pubtype_years
  has_many :journals, :class_name => "JournalPubtype", :include => :journal
  has_many :journal_pubtype_years

  def self.total_entries(period = 'all')
    cache_key = period + '_cached'
    Rails.cache.fetch(cache_key) { count('id', :conditions => "`#{period}` > 0") }
  end

  def self.search(query, options = {})
    options[:conditions] = ["#{options[:conditions]} AND #{Pubtype.table_name}.title LIKE ?", "#{query}%"] unless query.blank?
    options[:page]      ||= 1
    options[:per_page]  ||= 24
    paginate options
  end

  def to_s
    title
  end
end
