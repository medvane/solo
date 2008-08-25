class CreateAuthorGenes < ActiveRecord::Migration
  def self.up
    create_table :author_genes do |t|
      t.integer :author_id
      t.integer :gene_id
      t.integer :one_first
      t.integer :one_last
      t.integer :one_middle
      t.integer :one_total
      t.integer :five_first
      t.integer :five_last
      t.integer :five_middle
      t.integer :five_total
      t.integer :ten_first
      t.integer :ten_last
      t.integer :ten_middle
      t.integer :ten_total
      t.integer :all_first
      t.integer :all_last
      t.integer :all_middle
      t.integer :all_total
    end
    add_index :author_genes, [:author_id, :one_total, :one_first, :one_last, :one_middle], :name => "index_author_genes_on_author_id_and_one"
    add_index :author_genes, [:author_id, :five_total, :five_first, :five_last, :five_middle], :name => "index_author_genes_on_author_id_and_five"
    add_index :author_genes, [:author_id, :ten_total, :ten_first, :ten_last, :ten_middle], :name => "index_author_genes_on_author_id_and_ten"
    add_index :author_genes, [:author_id, :all_total, :all_first, :all_last, :all_middle], :name => "index_author_genes_on_author_id_and_all"
    add_index :author_genes, [:gene_id, :one_total, :one_first, :one_last, :one_middle], :name => "index_author_genes_on_gene_id_and_one"
    add_index :author_genes, [:gene_id, :five_total, :five_first, :five_last, :five_middle], :name => "index_author_genes_on_gene_id_and_five"
    add_index :author_genes, [:gene_id, :ten_total, :ten_first, :ten_last, :ten_middle], :name => "index_author_genes_on_gene_id_and_ten"
    add_index :author_genes, [:gene_id, :all_total, :all_first, :all_last, :all_middle], :name => "index_author_genes_on_gene_id_and_all"
  end

  def self.down
    drop_table :author_genes
  end
end
