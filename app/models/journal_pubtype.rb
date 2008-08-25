class JournalPubtype < ActiveRecord::Base
  belongs_to :journal
  belongs_to :pubtype
  named_scope :period, lambda {|period, limit| {
      :conditions => "`#{period}` > 0",
      :order => "`#{period}` desc",
      :limit => limit
    }
  }
end
