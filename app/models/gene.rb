class Gene < ActiveRecord::Base
  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options
  end

  def to_s
    "#{symbol} (#{taxonomy})"
  end
end
