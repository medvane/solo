class CreateCoauthorshipYears < ActiveRecord::Migration
  def self.up
    create_table :coauthorship_years do |t|
      t.integer :author_id
      t.integer :coauthor_id
      t.integer :year
      t.integer :first
      t.integer :last
      t.integer :middle
      t.integer :total
    end
    add_index :coauthorship_years, :author_id
  end

  def self.down
    drop_table :coauthorship_years
  end
end
