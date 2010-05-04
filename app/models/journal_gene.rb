class JournalGene < ActiveRecord::Base
  belongs_to :journal
  belongs_to :gene
  scope :period, lambda {|period, limit|
    where("`#{period}` > 0").order("`#{period}` desc").limit(limit)
  }
end
