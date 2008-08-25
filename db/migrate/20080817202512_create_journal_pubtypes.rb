class CreateJournalPubtypes < ActiveRecord::Migration
  def self.up
    create_table :journal_pubtypes do |t|
      t.integer :journal_id
      t.integer :pubtype_id
      t.integer :one
      t.integer :five
      t.integer :ten
      t.integer :all
    end
    add_index :journal_pubtypes, [:journal_id, :one]
    add_index :journal_pubtypes, [:journal_id, :five]
    add_index :journal_pubtypes, [:journal_id, :ten]
    add_index :journal_pubtypes, [:journal_id, :all]
    add_index :journal_pubtypes, [:pubtype_id, :one]
    add_index :journal_pubtypes, [:pubtype_id, :five]
    add_index :journal_pubtypes, [:pubtype_id, :ten]
    add_index :journal_pubtypes, [:pubtype_id, :all]
  end

  def self.down
    drop_table :journal_pubtypes
  end
end
