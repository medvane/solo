class SubjectGene < ActiveRecord::Base
  belongs_to :subject
  belongs_to :gene
end
