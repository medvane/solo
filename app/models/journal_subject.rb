class JournalSubject < ActiveRecord::Base
  belongs_to :journal
  belongs_to :subject
  scope :period, lambda {|period, limit|
    where("`#{period}_total` > 0").order("`#{period}_major` desc, `#{period}_total` desc").limit(limit)
  }
end
