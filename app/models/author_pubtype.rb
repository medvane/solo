class AuthorPubtype < ActiveRecord::Base
  belongs_to :author
  belongs_to :pubtype
end
