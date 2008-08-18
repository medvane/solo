class SubjectGeneYear < ActiveRecord::Base
  belongs_to :subject
  belongs_to :gene
end
