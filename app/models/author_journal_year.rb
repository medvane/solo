class AuthorJournalYear < ActiveRecord::Base
  belongs_to :author
  belongs_to :journal
end
