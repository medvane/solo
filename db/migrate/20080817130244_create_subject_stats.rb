class CreateSubjectStats < ActiveRecord::Migration
  def self.up
    create_table :subject_stats do |t|
      t.integer :subject_id
      t.integer :year
      t.integer :major
      t.integer :minor
      t.integer :total
      t.integer :rank
      t.integer :total_subjects
      t.integer :total_articles
    end
    add_index :subject_stats, :subject_id
    add_index :subject_stats, :year
  end

  def self.down
    drop_table :subject_stats
  end
end
