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

ActiveRecord::Schema.define(:version => 20080818163139) do

  create_table "article_stats", :force => true do |t|
    t.integer "year"
    t.integer "articles"
    t.integer "total_articles"
  end

  add_index "article_stats", ["year"], :name => "index_article_stats_on_year"

  create_table "article_types", :force => true do |t|
    t.integer "article_id"
    t.integer "pubtype_id"
  end

  add_index "article_types", ["article_id"], :name => "index_article_types_on_article_id"
  add_index "article_types", ["pubtype_id"], :name => "index_article_types_on_pubtype_id"

  create_table "articles", :force => true do |t|
    t.integer  "journal_id"
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

  add_index "articles", ["journal_id", "pubdate"], :name => "index_articles_on_journal_id_and_pubdate"
  add_index "articles", ["pubdate"], :name => "index_articles_on_pubdate"

  create_table "author_gene_years", :force => true do |t|
    t.integer "author_id"
    t.integer "gene_id"
    t.integer "year"
    t.integer "first"
    t.integer "last"
    t.integer "middle"
    t.integer "total"
  end

  add_index "author_gene_years", ["author_id", "year"], :name => "index_author_gene_years_on_author_id_and_year"
  add_index "author_gene_years", ["gene_id", "year"], :name => "index_author_gene_years_on_gene_id_and_year"

  create_table "author_genes", :force => true do |t|
    t.integer "author_id"
    t.integer "gene_id"
    t.integer "one_first"
    t.integer "one_last"
    t.integer "one_middle"
    t.integer "one_total"
    t.integer "five_first"
    t.integer "five_last"
    t.integer "five_middle"
    t.integer "five_total"
    t.integer "ten_first"
    t.integer "ten_last"
    t.integer "ten_middle"
    t.integer "ten_total"
    t.integer "all_first"
    t.integer "all_last"
    t.integer "all_middle"
    t.integer "all_total"
  end

  add_index "author_genes", ["author_id", "one_total", "one_first", "one_last", "one_middle"], :name => "index_author_genes_on_author_id_and_one"
  add_index "author_genes", ["author_id", "five_total", "five_first", "five_last", "five_middle"], :name => "index_author_genes_on_author_id_and_five"
  add_index "author_genes", ["author_id", "ten_total", "ten_first", "ten_last", "ten_middle"], :name => "index_author_genes_on_author_id_and_ten"
  add_index "author_genes", ["author_id", "all_total", "all_first", "all_last", "all_middle"], :name => "index_author_genes_on_author_id_and_all"
  add_index "author_genes", ["gene_id", "one_total", "one_first", "one_last", "one_middle"], :name => "index_author_genes_on_gene_id_and_one"
  add_index "author_genes", ["gene_id", "five_total", "five_first", "five_last", "five_middle"], :name => "index_author_genes_on_gene_id_and_five"
  add_index "author_genes", ["gene_id", "ten_total", "ten_first", "ten_last", "ten_middle"], :name => "index_author_genes_on_gene_id_and_ten"
  add_index "author_genes", ["gene_id", "all_total", "all_first", "all_last", "all_middle"], :name => "index_author_genes_on_gene_id_and_all"

  create_table "author_journal_years", :force => true do |t|
    t.integer "author_id"
    t.integer "journal_id"
    t.integer "year"
    t.integer "first"
    t.integer "last"
    t.integer "middle"
    t.integer "total"
  end

  add_index "author_journal_years", ["author_id", "year"], :name => "index_author_journal_years_on_author_id_and_year"
  add_index "author_journal_years", ["journal_id", "year"], :name => "index_author_journal_years_on_journal_id_and_year"

  create_table "author_journals", :force => true do |t|
    t.integer "author_id"
    t.integer "journal_id"
    t.integer "one_first"
    t.integer "one_last"
    t.integer "one_middle"
    t.integer "one_total"
    t.integer "five_first"
    t.integer "five_last"
    t.integer "five_middle"
    t.integer "five_total"
    t.integer "ten_first"
    t.integer "ten_last"
    t.integer "ten_middle"
    t.integer "ten_total"
    t.integer "all_first"
    t.integer "all_last"
    t.integer "all_middle"
    t.integer "all_total"
  end

  add_index "author_journals", ["author_id", "one_total", "one_first", "one_last", "one_middle"], :name => "index_author_journals_on_author_id_and_one"
  add_index "author_journals", ["author_id", "five_total", "five_first", "five_last", "five_middle"], :name => "index_author_journals_on_author_id_and_five"
  add_index "author_journals", ["author_id", "ten_total", "ten_first", "ten_last", "ten_middle"], :name => "index_author_journals_on_author_id_and_ten"
  add_index "author_journals", ["author_id", "all_total", "all_first", "all_last", "all_middle"], :name => "index_author_journals_on_author_id_and_all"
  add_index "author_journals", ["journal_id", "one_total", "one_first", "one_last", "one_middle"], :name => "index_author_journals_on_journal_id_and_one"
  add_index "author_journals", ["journal_id", "five_total", "five_first", "five_last", "five_middle"], :name => "index_author_journals_on_journal_id_and_five"
  add_index "author_journals", ["journal_id", "ten_total", "ten_first", "ten_last", "ten_middle"], :name => "index_author_journals_on_journal_id_and_ten"
  add_index "author_journals", ["journal_id", "all_total", "all_first", "all_last", "all_middle"], :name => "index_author_journals_on_journal_id_and_all"

  create_table "author_pubtype_years", :force => true do |t|
    t.integer "author_id"
    t.integer "pubtype_id"
    t.integer "year"
    t.integer "first"
    t.integer "last"
    t.integer "middle"
    t.integer "total"
  end

  add_index "author_pubtype_years", ["author_id", "year"], :name => "index_author_pubtype_years_on_author_id_and_year"
  add_index "author_pubtype_years", ["pubtype_id", "year"], :name => "index_author_pubtype_years_on_pubtype_id_and_year"

  create_table "author_pubtypes", :force => true do |t|
    t.integer "author_id"
    t.integer "pubtype_id"
    t.integer "one_first"
    t.integer "one_last"
    t.integer "one_middle"
    t.integer "one_total"
    t.integer "five_first"
    t.integer "five_last"
    t.integer "five_middle"
    t.integer "five_total"
    t.integer "ten_first"
    t.integer "ten_last"
    t.integer "ten_middle"
    t.integer "ten_total"
    t.integer "all_first"
    t.integer "all_last"
    t.integer "all_middle"
    t.integer "all_total"
  end

  add_index "author_pubtypes", ["author_id", "one_total", "one_first", "one_last", "one_middle"], :name => "index_author_pubtypes_on_author_id_and_one"
  add_index "author_pubtypes", ["author_id", "five_total", "five_first", "five_last", "five_middle"], :name => "index_author_pubtypes_on_author_id_and_five"
  add_index "author_pubtypes", ["author_id", "ten_total", "ten_first", "ten_last", "ten_middle"], :name => "index_author_pubtypes_on_author_id_and_ten"
  add_index "author_pubtypes", ["author_id", "all_total", "all_first", "all_last", "all_middle"], :name => "index_author_pubtypes_on_author_id_and_all"
  add_index "author_pubtypes", ["pubtype_id", "one_total", "one_first", "one_last", "one_middle"], :name => "index_author_pubtypes_on_pubtype_id_and_one"
  add_index "author_pubtypes", ["pubtype_id", "five_total", "five_first", "five_last", "five_middle"], :name => "index_author_pubtypes_on_pubtype_id_and_five"
  add_index "author_pubtypes", ["pubtype_id", "ten_total", "ten_first", "ten_last", "ten_middle"], :name => "index_author_pubtypes_on_pubtype_id_and_ten"
  add_index "author_pubtypes", ["pubtype_id", "all_total", "all_first", "all_last", "all_middle"], :name => "index_author_pubtypes_on_pubtype_id_and_all"

  create_table "author_stats", :force => true do |t|
    t.integer "author_id"
    t.integer "year"
    t.integer "first"
    t.integer "last"
    t.integer "middle"
    t.integer "total"
    t.integer "total_articles"
  end

  add_index "author_stats", ["author_id", "year"], :name => "index_author_stats_on_author_id_and_year"

  create_table "author_subject_years", :force => true do |t|
    t.integer "author_id"
    t.integer "subject_id"
    t.integer "year"
    t.integer "first"
    t.integer "last"
    t.integer "middle"
    t.integer "total"
  end

  add_index "author_subject_years", ["author_id", "year"], :name => "index_author_subject_years_on_author_id_and_year"
  add_index "author_subject_years", ["subject_id", "year"], :name => "index_author_subject_years_on_subject_id_and_year"

  create_table "author_subjects", :force => true do |t|
    t.integer "author_id"
    t.integer "subject_id"
    t.integer "one_first"
    t.integer "one_last"
    t.integer "one_middle"
    t.integer "one_total"
    t.integer "five_first"
    t.integer "five_last"
    t.integer "five_middle"
    t.integer "five_total"
    t.integer "ten_first"
    t.integer "ten_last"
    t.integer "ten_middle"
    t.integer "ten_total"
    t.integer "all_first"
    t.integer "all_last"
    t.integer "all_middle"
    t.integer "all_total"
  end

  add_index "author_subjects", ["author_id", "one_total", "one_first", "one_last", "one_middle"], :name => "index_author_subjects_on_author_id_and_one"
  add_index "author_subjects", ["author_id", "five_total", "five_first", "five_last", "five_middle"], :name => "index_author_subjects_on_author_id_and_five"
  add_index "author_subjects", ["author_id", "ten_total", "ten_first", "ten_last", "ten_middle"], :name => "index_author_subjects_on_author_id_and_ten"
  add_index "author_subjects", ["author_id", "all_total", "all_first", "all_last", "all_middle"], :name => "index_author_subjects_on_author_id_and_all"
  add_index "author_subjects", ["subject_id", "one_total", "one_first", "one_last", "one_middle"], :name => "index_author_subjects_on_subject_id_and_one"
  add_index "author_subjects", ["subject_id", "five_total", "five_first", "five_last", "five_middle"], :name => "index_author_subjects_on_subject_id_and_five"
  add_index "author_subjects", ["subject_id", "ten_total", "ten_first", "ten_last", "ten_middle"], :name => "index_author_subjects_on_subject_id_and_ten"
  add_index "author_subjects", ["subject_id", "all_total", "all_first", "all_last", "all_middle"], :name => "index_author_subjects_on_subject_id_and_all"

  create_table "authors", :force => true do |t|
    t.string  "last_name",       :default => "", :null => false
    t.string  "fore_name",       :default => "", :null => false
    t.string  "initials",        :default => "", :null => false
    t.string  "suffix",          :default => "", :null => false
    t.string  "collective_name", :default => "", :null => false
    t.integer "one_first",       :default => 0,  :null => false
    t.integer "one_last",        :default => 0,  :null => false
    t.integer "one_middle",      :default => 0,  :null => false
    t.integer "one_total",       :default => 0,  :null => false
    t.integer "five_first",      :default => 0,  :null => false
    t.integer "five_last",       :default => 0,  :null => false
    t.integer "five_middle",     :default => 0,  :null => false
    t.integer "five_total",      :default => 0,  :null => false
    t.integer "ten_first",       :default => 0,  :null => false
    t.integer "ten_last",        :default => 0,  :null => false
    t.integer "ten_middle",      :default => 0,  :null => false
    t.integer "ten_total",       :default => 0,  :null => false
    t.integer "all_first",       :default => 0,  :null => false
    t.integer "all_last",        :default => 0,  :null => false
    t.integer "all_middle",      :default => 0,  :null => false
    t.integer "all_total",       :default => 0,  :null => false
    t.integer "one_rank",        :default => 0,  :null => false
    t.integer "five_rank",       :default => 0,  :null => false
    t.integer "ten_rank",        :default => 0,  :null => false
    t.integer "all_rank",        :default => 0,  :null => false
  end

  add_index "authors", ["collective_name"], :name => "index_authors_on_collective_name"
  add_index "authors", ["last_name", "initials"], :name => "index_authors_on_last_name_and_initials"
  add_index "authors", ["one_total", "one_first", "one_last", "one_middle", "last_name", "fore_name"], :name => "index_authors_on_one"
  add_index "authors", ["five_total", "five_first", "five_last", "five_middle", "last_name", "fore_name"], :name => "index_authors_on_five"
  add_index "authors", ["ten_total", "ten_first", "ten_last", "ten_middle", "last_name", "fore_name"], :name => "index_authors_on_ten"
  add_index "authors", ["all_total", "all_first", "all_last", "all_middle", "last_name", "fore_name"], :name => "index_authors_on_all"
  add_index "authors", ["last_name", "fore_name", "one_total"], :name => "index_authors_on_last_name_and_fore_name_and_one_total"
  add_index "authors", ["last_name", "fore_name", "five_total"], :name => "index_authors_on_last_name_and_fore_name_and_five_total"
  add_index "authors", ["last_name", "fore_name", "ten_total"], :name => "index_authors_on_last_name_and_fore_name_and_ten_total"
  add_index "authors", ["last_name", "fore_name", "all_total"], :name => "index_authors_on_last_name_and_fore_name_and_all_total"

  create_table "authorships", :force => true do |t|
    t.integer "article_id"
    t.integer "position",      :limit => 2
    t.integer "last_position", :limit => 2
    t.integer "author_id"
    t.boolean "complete",                   :default => true
  end

  add_index "authorships", ["article_id", "position"], :name => "index_authorships_on_article_id_and_position"
  add_index "authorships", ["author_id"], :name => "index_authorships_on_author_id"

  create_table "bibliome_stats", :force => true do |t|
    t.integer  "one_journals"
    t.integer  "five_journals"
    t.integer  "ten_journals"
    t.integer  "all_journals"
    t.integer  "one_articles"
    t.integer  "five_articles"
    t.integer  "ten_articles"
    t.integer  "all_articles"
    t.integer  "one_authors"
    t.integer  "five_authors"
    t.integer  "ten_authors"
    t.integer  "all_authors"
    t.integer  "one_subjects"
    t.integer  "five_subjects"
    t.integer  "ten_subjects"
    t.integer  "all_subjects"
    t.integer  "one_genes"
    t.integer  "five_genes"
    t.integer  "ten_genes"
    t.integer  "all_genes"
    t.datetime "created_at"
  end

  create_table "coauthorship_years", :force => true do |t|
    t.integer "author_id"
    t.integer "coauthor_id"
    t.integer "year"
    t.integer "first"
    t.integer "last"
    t.integer "middle"
    t.integer "total"
  end

  add_index "coauthorship_years", ["author_id", "year"], :name => "index_coauthorship_years_on_author_id_and_year"

  create_table "coauthorships", :force => true do |t|
    t.integer "author_id"
    t.integer "coauthor_id"
    t.integer "one_first"
    t.integer "one_last"
    t.integer "one_middle"
    t.integer "one_total"
    t.integer "five_first"
    t.integer "five_last"
    t.integer "five_middle"
    t.integer "five_total"
    t.integer "ten_first"
    t.integer "ten_last"
    t.integer "ten_middle"
    t.integer "ten_total"
    t.integer "all_first"
    t.integer "all_last"
    t.integer "all_middle"
    t.integer "all_total"
  end

  add_index "coauthorships", ["author_id", "one_total", "one_first", "one_last", "one_middle"], :name => "index_coauthorships_on_author_id_and_one"
  add_index "coauthorships", ["author_id", "five_total", "five_first", "five_last", "five_middle"], :name => "index_coauthorships_on_author_id_and_five"
  add_index "coauthorships", ["author_id", "ten_total", "ten_first", "ten_last", "ten_middle"], :name => "index_coauthorships_on_author_id_and_ten"
  add_index "coauthorships", ["author_id", "all_total", "all_first", "all_last", "all_middle"], :name => "index_coauthorships_on_author_id_and_all"

  create_table "gene_stats", :force => true do |t|
    t.integer "gene_id"
    t.integer "year"
    t.integer "articles"
    t.integer "total_articles"
  end

  add_index "gene_stats", ["gene_id", "year"], :name => "index_gene_stats_on_gene_id_and_year"

  create_table "genes", :force => true do |t|
    t.string  "taxonomy"
    t.string  "symbol"
    t.string  "synonyms"
    t.string  "chromosome"
    t.string  "map_location"
    t.string  "description"
    t.integer "one"
    t.integer "five"
    t.integer "ten"
    t.integer "all"
  end

  add_index "genes", ["symbol"], :name => "index_genes_on_symbol"
  add_index "genes", ["one"], :name => "index_genes_on_one"
  add_index "genes", ["five"], :name => "index_genes_on_five"
  add_index "genes", ["ten"], :name => "index_genes_on_ten"
  add_index "genes", ["all"], :name => "index_genes_on_all"

  create_table "journal_gene_years", :force => true do |t|
    t.integer "journal_id"
    t.integer "gene_id"
    t.integer "year"
    t.integer "articles"
  end

  add_index "journal_gene_years", ["journal_id", "year"], :name => "index_journal_gene_years_on_journal_id_and_year"
  add_index "journal_gene_years", ["gene_id", "year"], :name => "index_journal_gene_years_on_gene_id_and_year"

  create_table "journal_genes", :force => true do |t|
    t.integer "journal_id"
    t.integer "gene_id"
    t.integer "one"
    t.integer "five"
    t.integer "ten"
    t.integer "all"
  end

  add_index "journal_genes", ["journal_id", "one"], :name => "index_journal_genes_on_journal_id_and_one"
  add_index "journal_genes", ["journal_id", "five"], :name => "index_journal_genes_on_journal_id_and_five"
  add_index "journal_genes", ["journal_id", "ten"], :name => "index_journal_genes_on_journal_id_and_ten"
  add_index "journal_genes", ["journal_id", "all"], :name => "index_journal_genes_on_journal_id_and_all"
  add_index "journal_genes", ["gene_id", "one"], :name => "index_journal_genes_on_gene_id_and_one"
  add_index "journal_genes", ["gene_id", "five"], :name => "index_journal_genes_on_gene_id_and_five"
  add_index "journal_genes", ["gene_id", "ten"], :name => "index_journal_genes_on_gene_id_and_ten"
  add_index "journal_genes", ["gene_id", "all"], :name => "index_journal_genes_on_gene_id_and_all"

  create_table "journal_pubtype_years", :force => true do |t|
    t.integer "journal_id"
    t.integer "pubtype_id"
    t.integer "year"
    t.integer "articles"
  end

  add_index "journal_pubtype_years", ["journal_id", "year"], :name => "index_journal_pubtype_years_on_journal_id_and_year"
  add_index "journal_pubtype_years", ["pubtype_id", "year"], :name => "index_journal_pubtype_years_on_pubtype_id_and_year"

  create_table "journal_pubtypes", :force => true do |t|
    t.integer "journal_id"
    t.integer "pubtype_id"
    t.integer "one"
    t.integer "five"
    t.integer "ten"
    t.integer "all"
  end

  add_index "journal_pubtypes", ["journal_id", "one"], :name => "index_journal_pubtypes_on_journal_id_and_one"
  add_index "journal_pubtypes", ["journal_id", "five"], :name => "index_journal_pubtypes_on_journal_id_and_five"
  add_index "journal_pubtypes", ["journal_id", "ten"], :name => "index_journal_pubtypes_on_journal_id_and_ten"
  add_index "journal_pubtypes", ["journal_id", "all"], :name => "index_journal_pubtypes_on_journal_id_and_all"
  add_index "journal_pubtypes", ["pubtype_id", "one"], :name => "index_journal_pubtypes_on_pubtype_id_and_one"
  add_index "journal_pubtypes", ["pubtype_id", "five"], :name => "index_journal_pubtypes_on_pubtype_id_and_five"
  add_index "journal_pubtypes", ["pubtype_id", "ten"], :name => "index_journal_pubtypes_on_pubtype_id_and_ten"
  add_index "journal_pubtypes", ["pubtype_id", "all"], :name => "index_journal_pubtypes_on_pubtype_id_and_all"

  create_table "journal_stats", :force => true do |t|
    t.integer "journal_id"
    t.integer "year"
    t.integer "articles"
    t.integer "total_articles"
  end

  add_index "journal_stats", ["journal_id", "year"], :name => "index_journal_stats_on_journal_id_and_year"

  create_table "journal_subject_years", :force => true do |t|
    t.integer "journal_id"
    t.integer "subject_id"
    t.integer "year"
    t.integer "major"
    t.integer "minor"
    t.integer "total"
  end

  add_index "journal_subject_years", ["journal_id", "year"], :name => "index_journal_subject_years_on_journal_id_and_year"
  add_index "journal_subject_years", ["subject_id", "year"], :name => "index_journal_subject_years_on_subject_id_and_year"

  create_table "journal_subjects", :force => true do |t|
    t.integer "journal_id"
    t.integer "subject_id"
    t.integer "one_major"
    t.integer "one_minor"
    t.integer "one_total"
    t.integer "five_major"
    t.integer "five_minor"
    t.integer "five_total"
    t.integer "ten_major"
    t.integer "ten_minor"
    t.integer "ten_total"
    t.integer "all_major"
    t.integer "all_minor"
    t.integer "all_total"
  end

  add_index "journal_subjects", ["journal_id", "one_major", "one_total"], :name => "index_journal_subjects_on_journal_id_and_one"
  add_index "journal_subjects", ["journal_id", "five_major", "five_total"], :name => "index_journal_subjects_on_journal_id_and_five"
  add_index "journal_subjects", ["journal_id", "ten_major", "ten_total"], :name => "index_journal_subjects_on_journal_id_and_ten"
  add_index "journal_subjects", ["journal_id", "all_major", "all_total"], :name => "index_journal_subjects_on_journal_id_and_all"
  add_index "journal_subjects", ["subject_id", "one_major", "one_total"], :name => "index_journal_subjects_on_subject_id_and_one"
  add_index "journal_subjects", ["subject_id", "five_major", "five_total"], :name => "index_journal_subjects_on_subject_id_and_five"
  add_index "journal_subjects", ["subject_id", "ten_major", "ten_total"], :name => "index_journal_subjects_on_subject_id_and_ten"
  add_index "journal_subjects", ["subject_id", "all_major", "all_total"], :name => "index_journal_subjects_on_subject_id_and_all"

  create_table "journals", :force => true do |t|
    t.string  "title"
    t.string  "abbr"
    t.string  "issn"
    t.string  "essn"
    t.string  "nlm_id"
    t.float   "impact_factor"
    t.integer "one",           :default => 0, :null => false
    t.integer "five",          :default => 0, :null => false
    t.integer "ten",           :default => 0, :null => false
    t.integer "all",           :default => 0, :null => false
  end

  add_index "journals", ["title"], :name => "index_journals_on_title"
  add_index "journals", ["abbr"], :name => "index_journals_on_abbr"
  add_index "journals", ["one"], :name => "index_journals_on_one"
  add_index "journals", ["five"], :name => "index_journals_on_five"
  add_index "journals", ["ten"], :name => "index_journals_on_ten"
  add_index "journals", ["all"], :name => "index_journals_on_all"

  create_table "published_genes", :force => true do |t|
    t.integer "gene_id"
    t.integer "article_id"
  end

  add_index "published_genes", ["gene_id", "article_id"], :name => "index_published_genes_on_gene_id_and_article_id"
  add_index "published_genes", ["article_id"], :name => "index_published_genes_on_article_id"

  create_table "pubtype_stats", :force => true do |t|
    t.integer "pubtype_id"
    t.integer "year"
    t.integer "articles"
    t.integer "total_articles"
  end

  add_index "pubtype_stats", ["pubtype_id", "year"], :name => "index_pubtype_stats_on_pubtype_id_and_year"

  create_table "pubtypes", :force => true do |t|
    t.string  "title"
    t.integer "one",   :default => 0, :null => false
    t.integer "five",  :default => 0, :null => false
    t.integer "ten",   :default => 0, :null => false
    t.integer "all",   :default => 0, :null => false
  end

  add_index "pubtypes", ["title"], :name => "index_pubtypes_on_title"
  add_index "pubtypes", ["one"], :name => "index_pubtypes_on_one"
  add_index "pubtypes", ["five"], :name => "index_pubtypes_on_five"
  add_index "pubtypes", ["ten"], :name => "index_pubtypes_on_ten"
  add_index "pubtypes", ["all"], :name => "index_pubtypes_on_all"

  create_table "subject_gene_years", :force => true do |t|
    t.integer "subject_id"
    t.integer "gene_id"
    t.integer "year"
    t.integer "articles"
  end

  add_index "subject_gene_years", ["subject_id", "year"], :name => "index_subject_gene_years_on_subject_id_and_year"
  add_index "subject_gene_years", ["gene_id", "year"], :name => "index_subject_gene_years_on_gene_id_and_year"

  create_table "subject_genes", :force => true do |t|
    t.integer "subject_id"
    t.integer "gene_id"
    t.integer "one"
    t.integer "five"
    t.integer "ten"
    t.integer "all"
  end

  add_index "subject_genes", ["subject_id", "one"], :name => "index_subject_genes_on_subject_id_and_one"
  add_index "subject_genes", ["subject_id", "five"], :name => "index_subject_genes_on_subject_id_and_five"
  add_index "subject_genes", ["subject_id", "ten"], :name => "index_subject_genes_on_subject_id_and_ten"
  add_index "subject_genes", ["subject_id", "all"], :name => "index_subject_genes_on_subject_id_and_all"
  add_index "subject_genes", ["gene_id", "one"], :name => "index_subject_genes_on_gene_id_and_one"
  add_index "subject_genes", ["gene_id", "five"], :name => "index_subject_genes_on_gene_id_and_five"
  add_index "subject_genes", ["gene_id", "ten"], :name => "index_subject_genes_on_gene_id_and_ten"
  add_index "subject_genes", ["gene_id", "all"], :name => "index_subject_genes_on_gene_id_and_all"

  create_table "subject_stats", :force => true do |t|
    t.integer "subject_id"
    t.integer "year"
    t.integer "major"
    t.integer "minor"
    t.integer "total"
    t.integer "rank"
    t.integer "total_subjects"
    t.integer "total_articles"
  end

  add_index "subject_stats", ["subject_id", "year"], :name => "index_subject_stats_on_subject_id_and_year"

  create_table "subjects", :force => true do |t|
    t.string  "term"
    t.integer "one_major"
    t.integer "one_minor"
    t.integer "one_total"
    t.integer "five_major"
    t.integer "five_minor"
    t.integer "five_total"
    t.integer "ten_major"
    t.integer "ten_minor"
    t.integer "ten_total"
    t.integer "all_major"
    t.integer "all_minor"
    t.integer "all_total"
    t.float   "one_to_five"
    t.float   "one_to_five_score"
    t.float   "one_to_ten"
    t.float   "one_to_ten_score"
    t.float   "one_to_all"
    t.float   "one_to_all_score"
    t.float   "five_to_ten"
    t.float   "five_to_ten_score"
    t.float   "five_to_all"
    t.float   "five_to_all_score"
    t.float   "ten_to_all"
    t.float   "ten_to_all_score"
  end

  add_index "subjects", ["one_major", "one_total", "term"], :name => "index_subjects_on_one_major_and_one_total_and_term"
  add_index "subjects", ["five_major", "five_total", "term"], :name => "index_subjects_on_five_major_and_five_total_and_term"
  add_index "subjects", ["ten_major", "ten_total", "term"], :name => "index_subjects_on_ten_major_and_ten_total_and_term"
  add_index "subjects", ["all_major", "all_total", "term"], :name => "index_subjects_on_all_major_and_all_total_and_term"
  add_index "subjects", ["one_to_five_score"], :name => "index_subjects_on_one_to_five_score"
  add_index "subjects", ["one_to_ten_score"], :name => "index_subjects_on_one_to_ten_score"
  add_index "subjects", ["one_to_all_score"], :name => "index_subjects_on_one_to_all_score"
  add_index "subjects", ["five_to_ten_score"], :name => "index_subjects_on_five_to_ten_score"
  add_index "subjects", ["five_to_all_score"], :name => "index_subjects_on_five_to_all_score"
  add_index "subjects", ["ten_to_all_score"], :name => "index_subjects_on_ten_to_all_score"

  create_table "topics", :force => true do |t|
    t.integer "article_id"
    t.integer "subject_id"
    t.boolean "major_topic"
  end

  add_index "topics", ["article_id"], :name => "index_topics_on_article_id"
  add_index "topics", ["subject_id", "article_id"], :name => "index_topics_on_subject_id_and_article_id"
  add_index "topics", ["major_topic"], :name => "index_topics_on_major_topic"

end
