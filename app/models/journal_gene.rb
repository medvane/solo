class JournalGene < ActiveRecord::Base
  belongs_to :journal
  belongs_to :gene
end
