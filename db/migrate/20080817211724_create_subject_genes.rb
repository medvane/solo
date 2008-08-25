class CreateSubjectGenes < ActiveRecord::Migration
  def self.up
    create_table :subject_genes do |t|
      t.integer :subject_id
      t.integer :gene_id
      t.integer :one
      t.integer :five
      t.integer :ten
      t.integer :all
    end
    add_index :subject_genes, [:subject_id, :one]
    add_index :subject_genes, [:subject_id, :five]
    add_index :subject_genes, [:subject_id, :ten]
    add_index :subject_genes, [:subject_id, :all]
    add_index :subject_genes, [:gene_id, :one]
    add_index :subject_genes, [:gene_id, :five]
    add_index :subject_genes, [:gene_id, :ten]
    add_index :subject_genes, [:gene_id, :all]
  end

  def self.down
    drop_table :subject_genes
  end
end
