class JournalSubjectYear < ActiveRecord::Base
  belongs_to :journal
  belongs_to :subject
end
