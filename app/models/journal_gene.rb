class JournalGene < ActiveRecord::Base
  belongs_to :journal
  belongs_to :gene
  scope :period, lambda {|period, limit|
    where("journal_genes.#{period} > 0").order("journal_genes.#{period} desc").limit(limit)
  }
end
