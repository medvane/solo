class CreateArticleTypes < ActiveRecord::Migration
  def self.up
    create_table :article_types do |t|
      t.integer :article_id
      t.integer :pubtype_id
    end
    add_index :article_types, :article_id
    add_index :article_types, :pubtype_id
  end

  def self.down
    drop_table :article_types
  end
end
