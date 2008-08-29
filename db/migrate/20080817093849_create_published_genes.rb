class CreatePublishedGenes < ActiveRecord::Migration
  def self.up
    create_table :published_genes do |t|
      t.integer :gene_id
      t.integer :article_id
    end
    add_index :published_genes, [:gene_id, :article_id]
    add_index :published_genes, :article_id
  end

  def self.down
    drop_table :published_genes
  end
end
