class JournalPubtype < ActiveRecord::Base
  belongs_to :journal
  belongs_to :pubtype
  scope :period, lambda {|period, limit|
    where("journal_pubtypes.#{period} > 0").order("journal_pubtypes.#{period} desc").limit(limit)
  }
end
