class Coauthorship < ActiveRecord::Base
  belongs_to :author
  belongs_to :coauthor, :class_name => "Author", :foreign_key => "coauthor_id"
  scope :period, lambda {|period, limit|
    where("#{period}_total > 0").order("#{period}_total desc, #{period}_first desc, #{period}_last desc, #{period}_middle desc").limit(limit)
  }
end
