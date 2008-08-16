class Article < ActiveRecord::Base
  belongs_to :journal
  
  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options
  end
end
