class CreateAuthorGeneYears < ActiveRecord::Migration
  def self.up
    create_table :author_gene_years do |t|
      t.integer :author_id
      t.integer :gene_id
      t.integer :year
      t.integer :first
      t.integer :last
      t.integer :middle
      t.integer :total
    end
    add_index :author_gene_years, [:author_id, :year]
    add_index :author_gene_years, [:gene_id, :year]
  end

  def self.down
    drop_table :author_gene_years
  end
end
