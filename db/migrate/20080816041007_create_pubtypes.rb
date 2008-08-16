class CreatePubtypes < ActiveRecord::Migration
  def self.up
    create_table :pubtypes do |t|
      t.string :title
      t.integer :one, :default => 0, :null => false
      t.integer :five, :default => 0, :null => false
      t.integer :ten, :default => 0, :null => false
      t.integer :all, :default => 0, :null => false
    end
    add_index :pubtypes, :title
    add_index :pubtypes, :one
    add_index :pubtypes, :five
    add_index :pubtypes, :ten
    add_index :pubtypes, :all
  end

  def self.down
    drop_table :pubtypes
  end
end
