class CreateArticleStats < ActiveRecord::Migration
  def self.up
    create_table :article_stats do |t|
      t.integer :year
      t.integer :articles
      t.integer :total_articles
    end
    add_index :article_stats, :year
  end

  def self.down
    drop_table :article_stats
  end
end
