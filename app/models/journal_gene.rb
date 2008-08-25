class JournalGene < ActiveRecord::Base
  belongs_to :journal
  belongs_to :gene
  named_scope :period, lambda {|period, limit| {
      :conditions => "`#{period}` > 0",
      :order => "`#{period}` desc",
      :limit => limit
    }
  }
end
