class CreateJournalGenes < ActiveRecord::Migration
  def self.up
    create_table :journal_genes do |t|
      t.integer :journal_id
      t.integer :gene_id
      t.integer :one
      t.integer :five
      t.integer :ten
      t.integer :all
    end
    add_index :journal_genes, :journal_id
    add_index :journal_genes, :gene_id
    add_index :journal_genes, :one
    add_index :journal_genes, :five
    add_index :journal_genes, :ten
    add_index :journal_genes, :all
  end

  def self.down
    drop_table :journal_genes
  end
end
