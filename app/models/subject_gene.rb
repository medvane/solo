class SubjectGene < ActiveRecord::Base
  belongs_to :subject
  belongs_to :gene
  scope :period, lambda {|period, limit|
    where("subject_genes.#{period} > 0").order("subject_genes.#{period} desc").limit(limit)
  }
end
