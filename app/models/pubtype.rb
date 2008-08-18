class Pubtype < ActiveRecord::Base
  has_many :article_types
  has_many :articles, :through => :article_types
  has_many :pubtype_stats
  has_many :author_pubtypes
  has_many :authors, :through => :author_pubtypes
  has_many :author_pubtype_years
  has_many :journal_pubtypes
  has_many :journals, :through => :journal_pubtypes
  has_many :journal_pubtype_years

  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options
  end

  def to_s
    title
  end
end
