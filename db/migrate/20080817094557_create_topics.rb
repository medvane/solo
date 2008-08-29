class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.integer :article_id
      t.integer :subject_id
      t.boolean :major_topic
    end
    add_index :topics, :article_id
    add_index :topics, [:subject_id, :article_id]
    add_index :topics, :major_topic
  end

  def self.down
    drop_table :topics
  end
end
