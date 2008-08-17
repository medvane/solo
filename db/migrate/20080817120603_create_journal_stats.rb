class CreateJournalStats < ActiveRecord::Migration
  def self.up
    create_table :journal_stats do |t|
      t.integer :journal_id
      t.integer :year
      t.integer :articles
      t.integer :total_articles
    end
    add_index :journal_stats, :journal_id
    add_index :journal_stats, :year
  end

  def self.down
    drop_table :journal_stats
  end
end
