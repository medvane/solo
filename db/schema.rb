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

ActiveRecord::Schema.define(:version => 20080818160719) do

  create_table "article_stats", :force => true do |t|
    t.integer "year",           :limit => 11
    t.integer "articles",       :limit => 11
    t.integer "total_articles", :limit => 11
  end

  add_index "article_stats", ["year"], :name => "index_article_stats_on_year"

  create_table "article_types", :force => true do |t|
    t.integer "article_id", :limit => 11
    t.integer "pubtype_id", :limit => 11
  end

  add_index "article_types", ["article_id"], :name => "index_article_types_on_article_id"
  add_index "article_types", ["pubtype_id"], :name => "index_article_types_on_pubtype_id"

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

  create_table "author_gene_years", :force => true do |t|
    t.integer "author_id", :limit => 11
    t.integer "gene_id",   :limit => 11
    t.integer "year",      :limit => 11
    t.integer "first",     :limit => 11
    t.integer "last",      :limit => 11
    t.integer "middle",    :limit => 11
    t.integer "total",     :limit => 11
  end

  add_index "author_gene_years", ["author_id"], :name => "index_author_gene_years_on_author_id"
  add_index "author_gene_years", ["gene_id"], :name => "index_author_gene_years_on_gene_id"

  create_table "author_genes", :force => true do |t|
    t.integer "author_id",   :limit => 11
    t.integer "gene_id",     :limit => 11
    t.integer "one_first",   :limit => 11
    t.integer "one_last",    :limit => 11
    t.integer "one_middle",  :limit => 11
    t.integer "one_total",   :limit => 11
    t.integer "five_first",  :limit => 11
    t.integer "five_last",   :limit => 11
    t.integer "five_middle", :limit => 11
    t.integer "five_total",  :limit => 11
    t.integer "ten_first",   :limit => 11
    t.integer "ten_last",    :limit => 11
    t.integer "ten_middle",  :limit => 11
    t.integer "ten_total",   :limit => 11
    t.integer "all_first",   :limit => 11
    t.integer "all_last",    :limit => 11
    t.integer "all_middle",  :limit => 11
    t.integer "all_total",   :limit => 11
  end

  add_index "author_genes", ["author_id"], :name => "index_author_genes_on_author_id"
  add_index "author_genes", ["gene_id"], :name => "index_author_genes_on_gene_id"
  add_index "author_genes", ["one_total"], :name => "index_author_genes_on_one_total"
  add_index "author_genes", ["five_total"], :name => "index_author_genes_on_five_total"
  add_index "author_genes", ["ten_total"], :name => "index_author_genes_on_ten_total"
  add_index "author_genes", ["all_total"], :name => "index_author_genes_on_all_total"

  create_table "author_journal_years", :force => true do |t|
    t.integer "author_id",  :limit => 11
    t.integer "journal_id", :limit => 11
    t.integer "year",       :limit => 11
    t.integer "first",      :limit => 11
    t.integer "last",       :limit => 11
    t.integer "other",      :limit => 11
    t.integer "total",      :limit => 11
  end

  add_index "author_journal_years", ["author_id"], :name => "index_author_journal_years_on_author_id"
  add_index "author_journal_years", ["journal_id"], :name => "index_author_journal_years_on_journal_id"

  create_table "author_journals", :force => true do |t|
    t.integer "author_id",   :limit => 11
    t.integer "journal_id",  :limit => 11
    t.integer "one_first",   :limit => 11
    t.integer "one_last",    :limit => 11
    t.integer "one_middle",  :limit => 11
    t.integer "one_total",   :limit => 11
    t.integer "five_first",  :limit => 11
    t.integer "five_last",   :limit => 11
    t.integer "five_middle", :limit => 11
    t.integer "five_total",  :limit => 11
    t.integer "ten_first",   :limit => 11
    t.integer "ten_last",    :limit => 11
    t.integer "ten_middle",  :limit => 11
    t.integer "ten_total",   :limit => 11
    t.integer "all_first",   :limit => 11
    t.integer "all_last",    :limit => 11
    t.integer "all_middle",  :limit => 11
    t.integer "all_total",   :limit => 11
  end

  add_index "author_journals", ["author_id"], :name => "index_author_journals_on_author_id"
  add_index "author_journals", ["journal_id"], :name => "index_author_journals_on_journal_id"
  add_index "author_journals", ["one_total"], :name => "index_author_journals_on_one_total"
  add_index "author_journals", ["five_total"], :name => "index_author_journals_on_five_total"
  add_index "author_journals", ["ten_total"], :name => "index_author_journals_on_ten_total"
  add_index "author_journals", ["all_total"], :name => "index_author_journals_on_all_total"

  create_table "author_pubtype_years", :force => true do |t|
    t.integer "author_id",  :limit => 11
    t.integer "pubtype_id", :limit => 11
    t.integer "year",       :limit => 11
    t.integer "first",      :limit => 11
    t.integer "last",       :limit => 11
    t.integer "middle",     :limit => 11
    t.integer "total",      :limit => 11
  end

  add_index "author_pubtype_years", ["author_id"], :name => "index_author_pubtype_years_on_author_id"
  add_index "author_pubtype_years", ["pubtype_id"], :name => "index_author_pubtype_years_on_pubtype_id"

  create_table "author_pubtypes", :force => true do |t|
    t.integer "author_id",   :limit => 11
    t.integer "pubtype_id",  :limit => 11
    t.integer "one_first",   :limit => 11
    t.integer "one_last",    :limit => 11
    t.integer "one_middle",  :limit => 11
    t.integer "one_total",   :limit => 11
    t.integer "five_first",  :limit => 11
    t.integer "five_last",   :limit => 11
    t.integer "five_middle", :limit => 11
    t.integer "five_total",  :limit => 11
    t.integer "ten_first",   :limit => 11
    t.integer "ten_last",    :limit => 11
    t.integer "ten_middle",  :limit => 11
    t.integer "ten_total",   :limit => 11
    t.integer "all_first",   :limit => 11
    t.integer "all_last",    :limit => 11
    t.integer "all_middle",  :limit => 11
    t.integer "all_total",   :limit => 11
  end

  add_index "author_pubtypes", ["author_id"], :name => "index_author_pubtypes_on_author_id"
  add_index "author_pubtypes", ["pubtype_id"], :name => "index_author_pubtypes_on_pubtype_id"
  add_index "author_pubtypes", ["one_total"], :name => "index_author_pubtypes_on_one_total"
  add_index "author_pubtypes", ["five_total"], :name => "index_author_pubtypes_on_five_total"
  add_index "author_pubtypes", ["ten_total"], :name => "index_author_pubtypes_on_ten_total"
  add_index "author_pubtypes", ["all_total"], :name => "index_author_pubtypes_on_all_total"

  create_table "author_stats", :force => true do |t|
    t.integer "author_id",      :limit => 11
    t.integer "year",           :limit => 11
    t.integer "first",          :limit => 11
    t.integer "last",           :limit => 11
    t.integer "middle",         :limit => 11
    t.integer "total",          :limit => 11
    t.integer "total_articles", :limit => 11
  end

  add_index "author_stats", ["author_id"], :name => "index_author_stats_on_author_id"
  add_index "author_stats", ["year"], :name => "index_author_stats_on_year"

  create_table "author_subject_years", :force => true do |t|
    t.integer "author_id",  :limit => 11
    t.integer "subject_id", :limit => 11
    t.integer "year",       :limit => 11
    t.integer "first",      :limit => 11
    t.integer "last",       :limit => 11
    t.integer "middle",     :limit => 11
    t.integer "total",      :limit => 11
  end

  add_index "author_subject_years", ["author_id"], :name => "index_author_subject_years_on_author_id"
  add_index "author_subject_years", ["subject_id"], :name => "index_author_subject_years_on_subject_id"

  create_table "author_subjects", :force => true do |t|
    t.integer "author_id",   :limit => 11
    t.integer "subject_id",  :limit => 11
    t.integer "one_first",   :limit => 11
    t.integer "one_last",    :limit => 11
    t.integer "one_middle",  :limit => 11
    t.integer "one_total",   :limit => 11
    t.integer "five_first",  :limit => 11
    t.integer "five_last",   :limit => 11
    t.integer "five_middle", :limit => 11
    t.integer "five_total",  :limit => 11
    t.integer "ten_first",   :limit => 11
    t.integer "ten_last",    :limit => 11
    t.integer "ten_middle",  :limit => 11
    t.integer "ten_total",   :limit => 11
    t.integer "all_first",   :limit => 11
    t.integer "all_last",    :limit => 11
    t.integer "all_middle",  :limit => 11
    t.integer "all_total",   :limit => 11
  end

  add_index "author_subjects", ["author_id"], :name => "index_author_subjects_on_author_id"
  add_index "author_subjects", ["subject_id"], :name => "index_author_subjects_on_subject_id"
  add_index "author_subjects", ["one_total"], :name => "index_author_subjects_on_one_total"
  add_index "author_subjects", ["five_total"], :name => "index_author_subjects_on_five_total"
  add_index "author_subjects", ["ten_total"], :name => "index_author_subjects_on_ten_total"
  add_index "author_subjects", ["all_total"], :name => "index_author_subjects_on_all_total"

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

  create_table "authorships", :force => true do |t|
    t.integer "article_id",    :limit => 11
    t.integer "position",      :limit => 2
    t.integer "last_position", :limit => 2
    t.integer "author_id",     :limit => 11
    t.boolean "complete",                    :default => true
  end

  add_index "authorships", ["article_id"], :name => "index_authorships_on_article_id"
  add_index "authorships", ["author_id"], :name => "index_authorships_on_author_id"
  add_index "authorships", ["position"], :name => "index_authorships_on_position"
  add_index "authorships", ["last_position"], :name => "index_authorships_on_last_position"

  create_table "bibliome_stats", :force => true do |t|
    t.integer  "one_journals",  :limit => 11
    t.integer  "five_journals", :limit => 11
    t.integer  "ten_journals",  :limit => 11
    t.integer  "all_journals",  :limit => 11
    t.integer  "one_articles",  :limit => 11
    t.integer  "five_articles", :limit => 11
    t.integer  "ten_articles",  :limit => 11
    t.integer  "all_articles",  :limit => 11
    t.integer  "one_authors",   :limit => 11
    t.integer  "five_authors",  :limit => 11
    t.integer  "ten_authors",   :limit => 11
    t.integer  "all_authors",   :limit => 11
    t.integer  "one_subjects",  :limit => 11
    t.integer  "five_subjects", :limit => 11
    t.integer  "ten_subjects",  :limit => 11
    t.integer  "all_subjects",  :limit => 11
    t.integer  "one_genes",     :limit => 11
    t.integer  "five_genes",    :limit => 11
    t.integer  "ten_genes",     :limit => 11
    t.integer  "all_genes",     :limit => 11
    t.datetime "created_at"
  end

  create_table "coauthorship_years", :force => true do |t|
    t.integer "author_id",   :limit => 11
    t.integer "coauthor_id", :limit => 11
    t.integer "year",        :limit => 11
    t.integer "first",       :limit => 11
    t.integer "last",        :limit => 11
    t.integer "middle",      :limit => 11
    t.integer "total",       :limit => 11
  end

  add_index "coauthorship_years", ["author_id"], :name => "index_coauthorship_years_on_author_id"

  create_table "coauthorships", :force => true do |t|
    t.integer "author_id",   :limit => 11
    t.integer "coauthor_id", :limit => 11
    t.integer "one_first",   :limit => 11
    t.integer "one_last",    :limit => 11
    t.integer "one_middle",  :limit => 11
    t.integer "one_total",   :limit => 11
    t.integer "five_first",  :limit => 11
    t.integer "five_last",   :limit => 11
    t.integer "five_middle", :limit => 11
    t.integer "five_total",  :limit => 11
    t.integer "ten_first",   :limit => 11
    t.integer "ten_last",    :limit => 11
    t.integer "ten_middle",  :limit => 11
    t.integer "ten_total",   :limit => 11
    t.integer "all_first",   :limit => 11
    t.integer "all_last",    :limit => 11
    t.integer "all_middle",  :limit => 11
    t.integer "all_total",   :limit => 11
  end

  add_index "coauthorships", ["author_id"], :name => "index_coauthorships_on_author_id"
  add_index "coauthorships", ["coauthor_id"], :name => "index_coauthorships_on_coauthor_id"
  add_index "coauthorships", ["one_total"], :name => "index_coauthorships_on_one_total"
  add_index "coauthorships", ["five_total"], :name => "index_coauthorships_on_five_total"
  add_index "coauthorships", ["ten_total"], :name => "index_coauthorships_on_ten_total"
  add_index "coauthorships", ["all_total"], :name => "index_coauthorships_on_all_total"

  create_table "gene_stats", :force => true do |t|
    t.integer "gene_id",        :limit => 11
    t.integer "year",           :limit => 11
    t.integer "articles",       :limit => 11
    t.integer "total_articles", :limit => 11
  end

  add_index "gene_stats", ["gene_id"], :name => "index_gene_stats_on_gene_id"
  add_index "gene_stats", ["year"], :name => "index_gene_stats_on_year"

  create_table "genes", :force => true do |t|
    t.string  "taxonomy"
    t.string  "symbol"
    t.string  "synonyms"
    t.string  "chromosome"
    t.string  "map_location"
    t.string  "description"
    t.integer "one",          :limit => 11
    t.integer "five",         :limit => 11
    t.integer "ten",          :limit => 11
    t.integer "all",          :limit => 11
  end

  add_index "genes", ["symbol"], :name => "index_genes_on_symbol"
  add_index "genes", ["one"], :name => "index_genes_on_one"
  add_index "genes", ["five"], :name => "index_genes_on_five"
  add_index "genes", ["ten"], :name => "index_genes_on_ten"
  add_index "genes", ["all"], :name => "index_genes_on_all"

  create_table "journal_genes", :force => true do |t|
    t.integer "journal_id", :limit => 11
    t.integer "gene_id",    :limit => 11
    t.integer "one",        :limit => 11
    t.integer "five",       :limit => 11
    t.integer "ten",        :limit => 11
    t.integer "all",        :limit => 11
  end

  add_index "journal_genes", ["journal_id"], :name => "index_journal_genes_on_journal_id"
  add_index "journal_genes", ["gene_id"], :name => "index_journal_genes_on_gene_id"
  add_index "journal_genes", ["one"], :name => "index_journal_genes_on_one"
  add_index "journal_genes", ["five"], :name => "index_journal_genes_on_five"
  add_index "journal_genes", ["ten"], :name => "index_journal_genes_on_ten"
  add_index "journal_genes", ["all"], :name => "index_journal_genes_on_all"

  create_table "journal_pubtypes", :force => true do |t|
    t.integer "journal_id", :limit => 11
    t.integer "pubtype_id", :limit => 11
    t.integer "one",        :limit => 11
    t.integer "five",       :limit => 11
    t.integer "ten",        :limit => 11
    t.integer "all",        :limit => 11
  end

  add_index "journal_pubtypes", ["journal_id"], :name => "index_journal_pubtypes_on_journal_id"
  add_index "journal_pubtypes", ["pubtype_id"], :name => "index_journal_pubtypes_on_pubtype_id"
  add_index "journal_pubtypes", ["one"], :name => "index_journal_pubtypes_on_one"
  add_index "journal_pubtypes", ["five"], :name => "index_journal_pubtypes_on_five"
  add_index "journal_pubtypes", ["ten"], :name => "index_journal_pubtypes_on_ten"
  add_index "journal_pubtypes", ["all"], :name => "index_journal_pubtypes_on_all"

  create_table "journal_stats", :force => true do |t|
    t.integer "journal_id",     :limit => 11
    t.integer "year",           :limit => 11
    t.integer "articles",       :limit => 11
    t.integer "total_articles", :limit => 11
  end

  add_index "journal_stats", ["journal_id"], :name => "index_journal_stats_on_journal_id"
  add_index "journal_stats", ["year"], :name => "index_journal_stats_on_year"

  create_table "journal_subjects", :force => true do |t|
    t.integer "journal_id", :limit => 11
    t.integer "subject_id", :limit => 11
    t.integer "one_major",  :limit => 11
    t.integer "one_minor",  :limit => 11
    t.integer "one_total",  :limit => 11
    t.integer "five_major", :limit => 11
    t.integer "five_minor", :limit => 11
    t.integer "five_total", :limit => 11
    t.integer "ten_major",  :limit => 11
    t.integer "ten_minor",  :limit => 11
    t.integer "ten_total",  :limit => 11
    t.integer "all_major",  :limit => 11
    t.integer "all_minor",  :limit => 11
    t.integer "all_total",  :limit => 11
  end

  add_index "journal_subjects", ["journal_id"], :name => "index_journal_subjects_on_journal_id"
  add_index "journal_subjects", ["subject_id"], :name => "index_journal_subjects_on_subject_id"
  add_index "journal_subjects", ["one_major"], :name => "index_journal_subjects_on_one_major"
  add_index "journal_subjects", ["five_major"], :name => "index_journal_subjects_on_five_major"
  add_index "journal_subjects", ["ten_major"], :name => "index_journal_subjects_on_ten_major"
  add_index "journal_subjects", ["all_major"], :name => "index_journal_subjects_on_all_major"

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

  create_table "published_genes", :force => true do |t|
    t.integer "gene_id",    :limit => 11
    t.integer "article_id", :limit => 11
  end

  add_index "published_genes", ["gene_id"], :name => "index_published_genes_on_gene_id"
  add_index "published_genes", ["article_id"], :name => "index_published_genes_on_article_id"

  create_table "pubtype_stats", :force => true do |t|
    t.integer "pubtype_id",     :limit => 11
    t.integer "year",           :limit => 11
    t.integer "articles",       :limit => 11
    t.integer "total_articles", :limit => 11
  end

  add_index "pubtype_stats", ["pubtype_id"], :name => "index_pubtype_stats_on_pubtype_id"
  add_index "pubtype_stats", ["year"], :name => "index_pubtype_stats_on_year"

  create_table "pubtypes", :force => true do |t|
    t.string  "title"
    t.integer "one",   :limit => 11, :default => 0, :null => false
    t.integer "five",  :limit => 11, :default => 0, :null => false
    t.integer "ten",   :limit => 11, :default => 0, :null => false
    t.integer "all",   :limit => 11, :default => 0, :null => false
  end

  add_index "pubtypes", ["title"], :name => "index_pubtypes_on_title"
  add_index "pubtypes", ["one"], :name => "index_pubtypes_on_one"
  add_index "pubtypes", ["five"], :name => "index_pubtypes_on_five"
  add_index "pubtypes", ["ten"], :name => "index_pubtypes_on_ten"
  add_index "pubtypes", ["all"], :name => "index_pubtypes_on_all"

  create_table "subject_genes", :force => true do |t|
    t.integer "subject_id", :limit => 11
    t.integer "gene_id",    :limit => 11
    t.integer "one",        :limit => 11
    t.integer "five",       :limit => 11
    t.integer "ten",        :limit => 11
    t.integer "all",        :limit => 11
  end

  add_index "subject_genes", ["subject_id"], :name => "index_subject_genes_on_subject_id"
  add_index "subject_genes", ["gene_id"], :name => "index_subject_genes_on_gene_id"
  add_index "subject_genes", ["one"], :name => "index_subject_genes_on_one"
  add_index "subject_genes", ["five"], :name => "index_subject_genes_on_five"
  add_index "subject_genes", ["ten"], :name => "index_subject_genes_on_ten"
  add_index "subject_genes", ["all"], :name => "index_subject_genes_on_all"

  create_table "subject_stats", :force => true do |t|
    t.integer "subject_id",     :limit => 11
    t.integer "year",           :limit => 11
    t.integer "major",          :limit => 11
    t.integer "minor",          :limit => 11
    t.integer "total",          :limit => 11
    t.integer "rank",           :limit => 11
    t.integer "total_subjects", :limit => 11
    t.integer "total_articles", :limit => 11
  end

  add_index "subject_stats", ["subject_id"], :name => "index_subject_stats_on_subject_id"
  add_index "subject_stats", ["year"], :name => "index_subject_stats_on_year"

  create_table "subjects", :force => true do |t|
    t.string  "term"
    t.integer "one_major",         :limit => 11
    t.integer "one_other",         :limit => 11
    t.integer "one_total",         :limit => 11
    t.integer "five_major",        :limit => 11
    t.integer "five_other",        :limit => 11
    t.integer "five_total",        :limit => 11
    t.integer "ten_major",         :limit => 11
    t.integer "ten_other",         :limit => 11
    t.integer "ten_total",         :limit => 11
    t.integer "all_major",         :limit => 11
    t.integer "all_other",         :limit => 11
    t.integer "all_total",         :limit => 11
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

  add_index "subjects", ["one_major"], :name => "index_subjects_on_one_major"
  add_index "subjects", ["five_major"], :name => "index_subjects_on_five_major"
  add_index "subjects", ["ten_major"], :name => "index_subjects_on_ten_major"
  add_index "subjects", ["all_major"], :name => "index_subjects_on_all_major"
  add_index "subjects", ["one_to_five_score"], :name => "index_subjects_on_one_to_five_score"
  add_index "subjects", ["one_to_ten_score"], :name => "index_subjects_on_one_to_ten_score"
  add_index "subjects", ["one_to_all_score"], :name => "index_subjects_on_one_to_all_score"
  add_index "subjects", ["five_to_ten_score"], :name => "index_subjects_on_five_to_ten_score"
  add_index "subjects", ["five_to_all_score"], :name => "index_subjects_on_five_to_all_score"
  add_index "subjects", ["ten_to_all_score"], :name => "index_subjects_on_ten_to_all_score"

  create_table "topics", :force => true do |t|
    t.integer "article_id",  :limit => 11
    t.integer "subject_id",  :limit => 11
    t.boolean "major_topic"
  end

  add_index "topics", ["article_id"], :name => "index_topics_on_article_id"
  add_index "topics", ["subject_id"], :name => "index_topics_on_subject_id"
  add_index "topics", ["major_topic"], :name => "index_topics_on_major_topic"

end
