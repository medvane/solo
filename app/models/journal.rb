class Journal < ActiveRecord::Base
  has_many :articles
  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options
  end

  def to_s
    abbr
  end
end
