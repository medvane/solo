class SubjectGene < ActiveRecord::Base
  belongs_to :subject
  belongs_to :gene
  scope :period, lambda {|period, limit|
    where("`#{period}` > 0").order("`#{period}` desc").limit(limit)
  }
end
