class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.string :term
      t.integer :one_major
      t.integer :one_other
      t.integer :one_total
      t.integer :five_major
      t.integer :five_other
      t.integer :five_total
      t.integer :ten_major
      t.integer :ten_other
      t.integer :ten_total
      t.integer :all_major
      t.integer :all_other
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
    add_index :subjects, :one_major
    add_index :subjects, :five_major
    add_index :subjects, :ten_major
    add_index :subjects, :all_major
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
