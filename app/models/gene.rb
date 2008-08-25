class Gene < ActiveRecord::Base
  has_many :published_genes
  has_many :articles, :through => :published_genes
  has_many :gene_stats, :order => "`gene_stats`.year"
  has_many :gene_authors, :class_name => "AuthorGene"
  has_many :authors, :through => :gene_authors
  has_many :author_gene_years
  has_many :gene_journals, :class_name => "JournalGene"
  has_many :journal, :through => :gene_journals
  has_many :journal_gene_years
  has_many :gene_subjects, :class_name => "SubjectGene"
  has_many :subjects, :through => :gene_subjects
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
