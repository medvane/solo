class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :journal_id
      t.string :vol
      t.string :issue
      t.string :page
      t.date :pubdate
      t.string :medline_date
      t.text :title
      t.text :vernacular_title
      t.text :abstract
      t.text :affiliation
      t.timestamps
    end
    add_index :articles, [:journal_id, :pubdate]
    add_index :articles, :pubdate
  end

  def self.down
    drop_table :articles
  end
end
