class CreateBibliomeStats < ActiveRecord::Migration
  def self.up
    create_table :bibliome_stats do |t|
      t.integer :one_journals
      t.integer :five_journals
      t.integer :ten_journals
      t.integer :all_journals
      t.integer :one_articles
      t.integer :five_articles
      t.integer :ten_articles
      t.integer :all_articles
      t.integer :one_authors
      t.integer :five_authors
      t.integer :ten_authors
      t.integer :all_authors
      t.integer :one_subjects
      t.integer :five_subjects
      t.integer :ten_subjects
      t.integer :all_subjects
      t.integer :one_genes
      t.integer :five_genes
      t.integer :ten_genes
      t.integer :all_genes
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :bibliome_stats
  end
end
