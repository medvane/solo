class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.string :term
      t.integer :one_major
      t.integer :one_minor
      t.integer :one_total
      t.integer :five_major
      t.integer :five_minor
      t.integer :five_total
      t.integer :ten_major
      t.integer :ten_minor
      t.integer :ten_total
      t.integer :all_major
      t.integer :all_minor
      t.integer :all_total
      t.float :one_to_five
      t.float :one_to_five_score
      t.float :one_to_ten
      t.float :one_to_ten_score
      t.float :one_to_all
      t.float :one_to_all_score
      t.float :five_to_ten
      t.float :five_to_ten_score
      t.float :five_to_all
      t.float :five_to_all_score
      t.float :ten_to_all
      t.float :ten_to_all_score
    end
    add_index :subjects, [:one_major, :one_total, :term]
    add_index :subjects, [:five_major, :five_total, :term]
    add_index :subjects, [:ten_major, :ten_total, :term]
    add_index :subjects, [:all_major, :all_total, :term]
    add_index :subjects, :one_to_five_score
    add_index :subjects, :one_to_ten_score
    add_index :subjects, :one_to_all_score
    add_index :subjects, :five_to_ten_score
    add_index :subjects, :five_to_all_score
    add_index :subjects, :ten_to_all_score
  end

  def self.down
    drop_table :subjects
  end
end
