class JournalSubject < ActiveRecord::Base
  belongs_to :journal
  belongs_to :subject
  scope :period, lambda {|period, limit|
    where("journal_subjects.#{period}_total > 0").order("journal_subjects.#{period}_major desc, journal_subjects.#{period}_total desc").limit(limit)
  }
end
