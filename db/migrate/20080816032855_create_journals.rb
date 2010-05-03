class CreateJournals < ActiveRecord::Migration
  def self.up
    create_table :journals do |t|
      t.string :title
      t.string :abbr
      t.string :issn
      t.string :essn
      t.string :nlm_id
      t.integer :one, :default => 0, :null => false
      t.integer :five, :default => 0, :null => false
      t.integer :ten, :default => 0, :null => false
      t.integer :all, :default => 0, :null => false
    end
    add_index :journals, :title
    add_index :journals, :abbr
    add_index :journals, :one
    add_index :journals, :five
    add_index :journals, :ten
    add_index :journals, :all
  end

  def self.down
    drop_table :journals
  end
end
