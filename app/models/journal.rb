class Journal < ActiveRecord::Base
  has_many :articles
  has_many :journal_stats
  has_many :author_journals
  has_many :authors, :through => :author_journals

  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options
  end

  def to_s
    abbr
  end
end
