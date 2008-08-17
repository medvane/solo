class Subject < ActiveRecord::Base
  has_many :topics
  has_many :articles, :through => :topics
  has_many :subject_stats

  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options
  end

  def to_s
    term
  end
end
