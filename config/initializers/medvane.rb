AUTHOR_ORDER = {
  "one" => "authors.one_total desc, authors.one_first desc, authors.one_last desc, authors.one_middle desc, authors.last_name desc",
  "five" => "authors.five_total desc, authors.five_first desc, authors.five_last desc, authors.five_middle desc, authors.last_name desc",
  "ten" => "authors.ten_total desc, authors.ten_first desc, authors.ten_last desc, authors.ten_middle desc, authors.last_name desc",
  "all" => "authors.all_total desc, authors.all_first desc, authors.all_last desc, authors.all_middle desc, authors.last_name desc"

}

SUBJECT_ORDER = {
  "one" => "subjects.one_major desc, subjects.one_total desc",
  "five" => "subjects.five_major desc, subjects.five_total desc",
  "ten" => "subjects.ten_major desc, subjects.ten_total desc",
  "all" => "subjects.all_major desc, subjects.all_total desc" 
}

ARTICLES_IN_MEMBER_PAGE = 6

MEDVANE_CONFIG = {}
MEDVANE_CONFIG['title'] = ENV['MEDVANE_CONFIG_TITLE'].present? ? ENV['MEDVANE_CONFIG_TITLE'] : "Medvane"
MEDVANE_CONFIG['items_in_neighbor'] = ENV['MEDVANE_CONFIG_ITEMS_IN_NEIGHBOR'].present? ? ENV['MEDVANE_CONFIG_ITEMS_IN_NEIGHBOR'] : 5
MEDVANE_CONFIG['pubmed_search_term'] = ENV['MEDVANE_CONFIG_PUBMED_SEARCH_TERM'] if ENV['MEDVANE_CONFIG_PUBMED_SEARCH_TERM'].present?
MEDVANE_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/medvane.yml") if File.exists?("#{RAILS_ROOT}/config/medvane.yml")