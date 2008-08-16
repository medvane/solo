# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080816035008) do

  create_table "articles", :force => true do |t|
    t.integer  "journal_id",       :limit => 11
    t.string   "vol"
    t.string   "issue"
    t.string   "page"
    t.date     "pubdate"
    t.string   "medline_date"
    t.text     "title"
    t.text     "vernacular_title"
    t.text     "abstract"
    t.text     "affiliation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["journal_id"], :name => "index_articles_on_journal_id"
  add_index "articles", ["pubdate"], :name => "index_articles_on_pubdate"

  create_table "authors", :force => true do |t|
    t.string  "last_name",                     :default => "", :null => false
    t.string  "fore_name",                     :default => "", :null => false
    t.string  "initials",                      :default => "", :null => false
    t.string  "suffix",                        :default => "", :null => false
    t.string  "collective_name",               :default => "", :null => false
    t.integer "one_first",       :limit => 11, :default => 0,  :null => false
    t.integer "one_last",        :limit => 11, :default => 0,  :null => false
    t.integer "one_middle",      :limit => 11, :default => 0,  :null => false
    t.integer "one_total",       :limit => 11, :default => 0,  :null => false
    t.integer "five_first",      :limit => 11, :default => 0,  :null => false
    t.integer "five_last",       :limit => 11, :default => 0,  :null => false
    t.integer "five_middle",     :limit => 11, :default => 0,  :null => false
    t.integer "five_total",      :limit => 11, :default => 0,  :null => false
    t.integer "ten_first",       :limit => 11, :default => 0,  :null => false
    t.integer "ten_last",        :limit => 11, :default => 0,  :null => false
    t.integer "ten_middle",      :limit => 11, :default => 0,  :null => false
    t.integer "ten_total",       :limit => 11, :default => 0,  :null => false
    t.integer "all_first",       :limit => 11, :default => 0,  :null => false
    t.integer "all_last",        :limit => 11, :default => 0,  :null => false
    t.integer "all_middle",      :limit => 11, :default => 0,  :null => false
    t.integer "all_total",       :limit => 11, :default => 0,  :null => false
    t.integer "one_rank",        :limit => 11, :default => 0,  :null => false
    t.integer "five_rank",       :limit => 11, :default => 0,  :null => false
    t.integer "ten_rank",        :limit => 11, :default => 0,  :null => false
    t.integer "all_rank",        :limit => 11, :default => 0,  :null => false
  end

  add_index "authors", ["last_name", "initials"], :name => "index_authors_on_last_name_and_initials"
  add_index "authors", ["collective_name"], :name => "index_authors_on_collective_name"
  add_index "authors", ["one_total"], :name => "index_authors_on_one_total"
  add_index "authors", ["five_total"], :name => "index_authors_on_five_total"
  add_index "authors", ["ten_total"], :name => "index_authors_on_ten_total"
  add_index "authors", ["all_total"], :name => "index_authors_on_all_total"
  add_index "authors", ["one_rank"], :name => "index_authors_on_one_rank"
  add_index "authors", ["five_rank"], :name => "index_authors_on_five_rank"
  add_index "authors", ["ten_rank"], :name => "index_authors_on_ten_rank"
  add_index "authors", ["all_rank"], :name => "index_authors_on_all_rank"

  create_table "journals", :force => true do |t|
    t.string  "title"
    t.string  "abbr"
    t.string  "issn"
    t.string  "essn"
    t.string  "nlm_id"
    t.float   "impact_factor"
    t.integer "one",           :limit => 11, :default => 0, :null => false
    t.integer "five",          :limit => 11, :default => 0, :null => false
    t.integer "ten",           :limit => 11, :default => 0, :null => false
    t.integer "all",           :limit => 11, :default => 0, :null => false
  end

  add_index "journals", ["title"], :name => "index_journals_on_title"
  add_index "journals", ["abbr"], :name => "index_journals_on_abbr"
  add_index "journals", ["one"], :name => "index_journals_on_one"
  add_index "journals", ["five"], :name => "index_journals_on_five"
  add_index "journals", ["ten"], :name => "index_journals_on_ten"
  add_index "journals", ["all"], :name => "index_journals_on_all"

end
