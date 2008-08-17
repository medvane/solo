class Coauthorship < ActiveRecord::Base
  belongs_to :author
  belongs_to :coauthor, :class_name => "Author", :foreign_key => "coauthor_id"
end
