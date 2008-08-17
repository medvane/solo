class CreateGeneStats < ActiveRecord::Migration
  def self.up
    create_table :gene_stats do |t|
      t.integer :gene_id
      t.integer :year
      t.integer :articles
      t.integer :total_articles
    end
    add_index :gene_stats, :gene_id
    add_index :gene_stats, :year
  end

  def self.down
    drop_table :gene_stats
  end
end
