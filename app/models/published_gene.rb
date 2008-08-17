class PublishedGene < ActiveRecord::Base
  belongs_to :gene
  belongs_to :article
end
