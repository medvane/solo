class Article < ActiveRecord::Base
  belongs_to :journal
  has_many :authorships
  has_many :authors, :through => :authorships, :order => "authorships.position"
  has_many :article_types
  has_many :pubtypes, :through => :article_types
  has_many :published_genes
  has_many :genes, :through => :published_genes
  has_many :subjects, :class_name => 'Topic', :include => :subject
  #has_many :subjects, :through => :topics
  
  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 10
    paginate options
  end

  def to_s
    title
  end
end
