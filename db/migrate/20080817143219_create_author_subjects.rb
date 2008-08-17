class CreateAuthorSubjects < ActiveRecord::Migration
  def self.up
    create_table :author_subjects do |t|
      t.integer :author_id
      t.integer :subject_id
      t.integer :one_first
      t.integer :one_last
      t.integer :one_middle
      t.integer :one_total
      t.integer :five_first
      t.integer :five_last
      t.integer :five_middle
      t.integer :five_total
      t.integer :ten_first
      t.integer :ten_last
      t.integer :ten_middle
      t.integer :ten_total
      t.integer :all_first
      t.integer :all_last
      t.integer :all_middle
      t.integer :all_total
    end
    add_index :author_subjects, :author_id
    add_index :author_subjects, :subject_id
    add_index :author_subjects, :one_total
    add_index :author_subjects, :five_total
    add_index :author_subjects, :ten_total
    add_index :author_subjects, :all_total
  end

  def self.down
    drop_table :author_subjects
  end
end
