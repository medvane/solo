class CreateAuthorships < ActiveRecord::Migration
  def self.up
    create_table :authorships do |t|
      t.integer :article_id
      t.integer :position, :limit => 2
      t.integer :last_position, :limit => 2
      t.integer :author_id
      t.boolean :complete, :default => true
    end
    add_index :authorships, [:article_id, :position]
    add_index :authorships, :author_id
  end

  def self.down
    drop_table :authorships
  end
end
