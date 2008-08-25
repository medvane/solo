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
    add_index :journal_subjects, [:journal_id, :one_major, :one_total], :name => "index_journal_subjects_on_journal_id_and_one"
    add_index :journal_subjects, [:journal_id, :five_major, :five_total], :name => "index_journal_subjects_on_journal_id_and_five"
    add_index :journal_subjects, [:journal_id, :ten_major, :ten_total], :name => "index_journal_subjects_on_journal_id_and_ten"
    add_index :journal_subjects, [:journal_id, :all_major, :all_total], :name => "index_journal_subjects_on_journal_id_and_all"
    add_index :journal_subjects, [:subject_id, :one_major, :one_total], :name => "index_journal_subjects_on_subject_id_and_one"
    add_index :journal_subjects, [:subject_id, :five_major, :five_total], :name => "index_journal_subjects_on_subject_id_and_five"
    add_index :journal_subjects, [:subject_id, :ten_major, :ten_total], :name => "index_journal_subjects_on_subject_id_and_ten"
    add_index :journal_subjects, [:subject_id, :all_major, :all_total], :name => "index_journal_subjects_on_subject_id_and_all"
  end

  def self.down
    drop_table :journal_subjects
  end
end
