class Pubtype < ActiveRecord::Base
  has_many :article_types
  has_many :articles, :through => :article_types
  has_many :pubtype_stats

  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options
  end

  def to_s
    title
  end
end
