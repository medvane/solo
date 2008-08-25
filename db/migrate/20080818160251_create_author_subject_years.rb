class CreateAuthorSubjectYears < ActiveRecord::Migration
  def self.up
    create_table :author_subject_years do |t|
      t.integer :author_id
      t.integer :subject_id
      t.integer :year
      t.integer :first
      t.integer :last
      t.integer :middle
      t.integer :total
    end
    add_index :author_subject_years, [:author_id, :year]
    add_index :author_subject_years, [:subject_id, :year]
  end

  def self.down
    drop_table :author_subject_years
  end
end
