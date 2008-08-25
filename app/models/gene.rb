class Gene < ActiveRecord::Base
  has_many :published_genes
  has_many :articles, :through => :published_genes
  has_many :gene_stats, :order => "`gene_stats`.year"
  has_many :authors, :class_name => "AuthorGene", :include => :author
  has_many :author_gene_years
  has_many :journals, :class_name => "JournalGene", :include => :journal
  has_many :journal_gene_years
  has_many :subjects, :class_name => "SubjectGene", :include => :subject
  has_many :subject_gene_years

  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 40
    paginate options
  end

  def to_s
    "#{symbol} (#{taxonomy})"
  end
end
