class BibliomeStat < ActiveRecord::Base
  def self.last_cached
    Rails.cache.fetch('BibliomeStat.last') { BibliomeStat.last }
  end
end
