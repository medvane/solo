class CreateGenes < ActiveRecord::Migration
  def self.up
    create_table :genes do |t|
      t.string :taxonomy
      t.string :symbol
      t.string :synonyms
      t.string :chromosome
      t.string :map_location
      t.string :description
      t.integer :one
      t.integer :five
      t.integer :ten
      t.integer :all
    end
    add_index :genes, :symbol
    add_index :genes, :one
    add_index :genes, :five
    add_index :genes, :ten
    add_index :genes, :all
  end

  def self.down
    drop_table :genes
  end
end
