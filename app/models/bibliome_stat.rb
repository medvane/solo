class BibliomeStat < ActiveRecord::Base
  def self.last_cached
    Rails.cache.fetch('BibliomeStat.last') { last }
  end
end
