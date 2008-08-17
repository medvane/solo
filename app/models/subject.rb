class Subject < ActiveRecord::Base
  has_many :topics
  has_many :articles, :through => :topics
  has_many :subject_stats
  has_many :author_subjects
  has_many :authors, :through => :author_subjects
  has_many :journal_subjects
  has_many :journals, :through => :journal_subjects

  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options
  end

  def to_s
    term
  end
end
