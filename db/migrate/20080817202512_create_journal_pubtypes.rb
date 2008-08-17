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
    add_index :journal_pubtypes, :journal_id
    add_index :journal_pubtypes, :pubtype_id
    add_index :journal_pubtypes, :one
    add_index :journal_pubtypes, :five
    add_index :journal_pubtypes, :ten
    add_index :journal_pubtypes, :all
  end

  def self.down
    drop_table :journal_pubtypes
  end
end
