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
    add_index :journal_genes, [:journal_id, :one]
    add_index :journal_genes, [:journal_id, :five]
    add_index :journal_genes, [:journal_id, :ten]
    add_index :journal_genes, [:journal_id, :all]
    add_index :journal_genes, [:gene_id, :one]
    add_index :journal_genes, [:gene_id, :five]
    add_index :journal_genes, [:gene_id, :ten]
    add_index :journal_genes, [:gene_id, :all]
  end

  def self.down
    drop_table :journal_genes
  end
end
