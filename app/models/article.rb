class Article < ActiveRecord::Base
  belongs_to :journal
  has_many :authorships
  has_many :authors, :through => :authorships, :order => "authorships.position"
  
  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options
  end

  def to_s
    title
  end
end
