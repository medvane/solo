class CreateSubjectGeneYears < ActiveRecord::Migration
  def self.up
    create_table :subject_gene_years do |t|
      t.integer :subject_id
      t.integer :gene_id
      t.integer :year
      t.integer :articles
    end
    add_index :subject_gene_years, :subject_id
    add_index :subject_gene_years, :gene_id
  end

  def self.down
    drop_table :subject_gene_years
  end
end
