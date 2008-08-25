class CreateAuthorPubtypes < ActiveRecord::Migration
  def self.up
    create_table :author_pubtypes do |t|
      t.integer :author_id
      t.integer :pubtype_id
      t.integer :one_first
      t.integer :one_last
      t.integer :one_middle
      t.integer :one_total
      t.integer :five_first
      t.integer :five_last
      t.integer :five_middle
      t.integer :five_total
      t.integer :ten_first
      t.integer :ten_last
      t.integer :ten_middle
      t.integer :ten_total
      t.integer :all_first
      t.integer :all_last
      t.integer :all_middle
      t.integer :all_total
    end
    add_index :author_pubtypes, [:author_id, :one_total, :one_first, :one_last, :one_middle], :name => "index_author_pubtypes_on_author_id_and_one"
    add_index :author_pubtypes, [:author_id, :five_total, :five_first, :five_last, :five_middle], :name => "index_author_pubtypes_on_author_id_and_five"
    add_index :author_pubtypes, [:author_id, :ten_total, :ten_first, :ten_last, :ten_middle], :name => "index_author_pubtypes_on_author_id_and_ten"
    add_index :author_pubtypes, [:author_id, :all_total, :all_first, :all_last, :all_middle], :name => "index_author_pubtypes_on_author_id_and_all"
    add_index :author_pubtypes, [:pubtype_id, :one_total, :one_first, :one_last, :one_middle], :name => "index_author_pubtypes_on_pubtype_id_and_one"
    add_index :author_pubtypes, [:pubtype_id, :five_total, :five_first, :five_last, :five_middle], :name => "index_author_pubtypes_on_pubtype_id_and_five"
    add_index :author_pubtypes, [:pubtype_id, :ten_total, :ten_first, :ten_last, :ten_middle], :name => "index_author_pubtypes_on_pubtype_id_and_ten"
    add_index :author_pubtypes, [:pubtype_id, :all_total, :all_first, :all_last, :all_middle], :name => "index_author_pubtypes_on_pubtype_id_and_all"
  end

  def self.down
    drop_table :author_pubtypes
  end
end
