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

ActiveRecord::Schema.define(:version => 20080816032855) do

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
