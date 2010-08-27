namespace :mdvn do
  # ActiveRecord::Base.connection.execute(load_data_infile)
  # TRUNCATE TABLE #{quoted_table_name}
  # ALTER TABLE #{quoted_table_name} DISABLE KEYS
  # LOAD DATA LOCAL INFILE '#{file}' INTO TABLE #{quoted_table_name}
  # ALTER TABLE #{quoted_table_name} ENABLE KEYS
  desc "Load data in db/dat/*.dat into MySQL database"
  task :load_data => :environment do
    total_size = 0
    Dir.glob(File.join(Rails.root, "db", "dat", "*.dat")) do |file|
      table_name = File.basename(file, ".dat")
      quoted_table_name = quote_table_name(table_name)
      file_size = File.size(file)
      total_size += file_size
      if file_size > 0
        progress("Loading #{file_size} byte data into #{table_name}")
        execute("ALTER TABLE #{quoted_table_name} ENGINE = MyISAM")
        execute("TRUNCATE TABLE #{quoted_table_name}")
        execute("ALTER TABLE #{quoted_table_name} DISABLE KEYS")
        execute("LOAD DATA LOCAL INFILE '#{file}' INTO TABLE #{quoted_table_name}")
        progress("adding index to #{quoted_table_name}")
        execute("ALTER TABLE #{quoted_table_name} ENABLE KEYS")
      end
    end
    puts "[#{Time.now.to_s}] #{total_size} byte data loaded"
  end

  def execute(sql)
    ActiveRecord::Base.connection.execute(sql)
  end

  def quote_table_name(table_name)
    ActiveRecord::Base.connection.quote_table_name(table_name)
  end

  def progress(message)
    puts "[#{Time.now.to_s}] #{message}"
  end
end