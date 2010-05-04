class JournalPubtype < ActiveRecord::Base
  belongs_to :journal
  belongs_to :pubtype
  scope :period, lambda {|period, limit|
    where("`#{period}` > 0").order("`#{period}` desc").limit(limit)
  }
end
