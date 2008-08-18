class CreateJournalGeneYears < ActiveRecord::Migration
  def self.up
    create_table :journal_gene_years do |t|
      t.integer :journal_id
      t.integer :gene_id
      t.integer :year
      t.integer :articles
    end
    add_index :journal_gene_years, :journal_id
    add_index :journal_gene_years, :gene_id
  end

  def self.down
    drop_table :journal_gene_years
  end
end
