class CreateAuthorJournalYears < ActiveRecord::Migration
  def self.up
    create_table :author_journal_years do |t|
      t.integer :author_id
      t.integer :journal_id
      t.integer :year
      t.integer :first
      t.integer :last
      t.integer :middle
      t.integer :total
    end
    add_index :author_journal_years, [:author_id, :year]
    add_index :author_journal_years, [:journal_id, :year]
  end

  def self.down
    drop_table :author_journal_years
  end
end
