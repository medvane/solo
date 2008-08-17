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
    add_index :subject_genes, :subject_id
    add_index :subject_genes, :gene_id
    add_index :subject_genes, :one
    add_index :subject_genes, :five
    add_index :subject_genes, :ten
    add_index :subject_genes, :all
  end

  def self.down
    drop_table :subject_genes
  end
end
