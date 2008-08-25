class CreateJournalSubjectYears < ActiveRecord::Migration
  def self.up
    create_table :journal_subject_years do |t|
      t.integer :journal_id
      t.integer :subject_id
      t.integer :year
      t.integer :major
      t.integer :minor
      t.integer :total
    end
    add_index :journal_subject_years, [:journal_id, :year]
    add_index :journal_subject_years, [:subject_id, :year]
  end

  def self.down
    drop_table :journal_subject_years
  end
end
