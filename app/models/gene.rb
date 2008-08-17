class Gene < ActiveRecord::Base
  has_many :published_genes
  has_many :articles, :through => :published_genes

  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options
  end

  def to_s
    "#{symbol} (#{taxonomy})"
  end
end
