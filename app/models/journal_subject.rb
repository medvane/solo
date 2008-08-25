class JournalSubject < ActiveRecord::Base
  belongs_to :journal
  belongs_to :subject
  named_scope :period, lambda {|period, limit| {
      :conditions => "`#{period}_total` > 0",
      :order => "`#{period}_major` desc, `#{period}_total` desc",
      :limit => limit
    }
  }
end
