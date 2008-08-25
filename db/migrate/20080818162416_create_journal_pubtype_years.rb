class CreateJournalPubtypeYears < ActiveRecord::Migration
  def self.up
    create_table :journal_pubtype_years do |t|
      t.integer :journal_id
      t.integer :pubtype_id
      t.integer :year
      t.integer :articles
    end
    add_index :journal_pubtype_years, [:journal_id, :year]
    add_index :journal_pubtype_years, [:pubtype_id, :year]
  end

  def self.down
    drop_table :journal_pubtype_years
  end
end
