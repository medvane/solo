class CreatePubtypeStats < ActiveRecord::Migration
  def self.up
    create_table :pubtype_stats do |t|
      t.integer :pubtype_id
      t.integer :year
      t.integer :articles
      t.integer :total_articles
    end
    add_index :pubtype_stats, [:pubtype_id, :year]
  end

  def self.down
    drop_table :pubtype_stats
  end
end
