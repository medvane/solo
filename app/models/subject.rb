class Subject < ActiveRecord::Base
  has_many :topics
  has_many :articles, :through => :topics, :order => "articles.id desc", :include => :journal
  has_many :subject_stats
  has_many :authors, :class_name => "AuthorSubject", :include => :author
  has_many :author_subject_years
  has_many :journals, :class_name => "JournalSubject", :include => :journal
  has_many :journal_subject_years
  has_many :genes, :class_name => "SubjectGene", :include => :gene 
  has_many :subject_gene_years

  def self.total_entries(period = 'all')
    cache_key = period + '_major_cached'
    Rails.cache.fetch(cache_key) { count('id', :conditions => "subjects.#{period}_major > 0") }
  end

  def self.search(query, options = {})
    options[:conditions] = ["#{options[:conditions]} AND #{Subject.table_name}.term LIKE ?", "#{query}%"] unless query.blank?
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    options[:order]     ||= SUBJECT_ORDER['all']
    paginate options
  end

  def to_s
    term
  end
end
