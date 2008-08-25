class AuthorGene < ActiveRecord::Base
  belongs_to :author
  belongs_to :gene
  named_scope :period, lambda {|period, limit| {
      :conditions => "#{period}_total > 0",
      :order => "#{period}_total desc, #{period}_first desc, #{period}_last desc, #{period}_middle desc",
      :limit => limit
    }
  }
end
