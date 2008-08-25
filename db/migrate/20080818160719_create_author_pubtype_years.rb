class CreateAuthorPubtypeYears < ActiveRecord::Migration
  def self.up
    create_table :author_pubtype_years do |t|
      t.integer :author_id
      t.integer :pubtype_id
      t.integer :year
      t.integer :first
      t.integer :last
      t.integer :middle
      t.integer :total
    end
    add_index :author_pubtype_years, [:author_id, :year]
    add_index :author_pubtype_years, [:pubtype_id, :year]
  end

  def self.down
    drop_table :author_pubtype_years
  end
end
