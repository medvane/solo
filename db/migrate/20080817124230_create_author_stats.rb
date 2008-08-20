class CreateAuthorStats < ActiveRecord::Migration
  def self.up
    create_table :author_stats do |t|
      t.integer :author_id
      t.integer :year
      t.integer :first
      t.integer :last
      t.integer :middle
      t.integer :total
      t.integer :total_articles
    end
    add_index :author_stats, [:author_id, :year]
  end

  def self.down
    drop_table :author_stats
  end
end
