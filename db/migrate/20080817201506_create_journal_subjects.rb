class CreateJournalSubjects < ActiveRecord::Migration
  def self.up
    create_table :journal_subjects do |t|
      t.integer :journal_id
      t.integer :subject_id
      t.integer :one_major
      t.integer :one_minor
      t.integer :one_total
      t.integer :five_major
      t.integer :five_minor
      t.integer :five_total
      t.integer :ten_major
      t.integer :ten_minor
      t.integer :ten_total
      t.integer :all_major
      t.integer :all_minor
      t.integer :all_total
    end
    add_index :journal_subjects, :journal_id
    add_index :journal_subjects, :subject_id
    add_index :journal_subjects, :one_major
    add_index :journal_subjects, :five_major
    add_index :journal_subjects, :ten_major
    add_index :journal_subjects, :all_major
  end

  def self.down
    drop_table :journal_subjects
  end
end
