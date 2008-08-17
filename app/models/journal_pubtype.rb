class JournalPubtype < ActiveRecord::Base
  belongs_to :journal
  belongs_to :pubtype
end
