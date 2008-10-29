# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.1' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use. To use Rails without a database
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Specify gems that this application depends on. 
  # They can then be installed with "rake gems:install" on new installations.
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "aws-s3", :lib => "aws/s3"
  config.gem 'mislav-will_paginate', :version => '~> 2.3.6', :lib => 'will_paginate', :source => 'http://gems.github.com'
  config.gem 'mattetti-googlecharts', :version => '~> 1.3.5', :lib => 'gchart', :source => 'http://gems.github.com'

  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Make Time.zone default to the specified zone, and make Active Record store time values
  # in the database in UTC, and return them converted to the specified local zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Uncomment to use default local time.
  config.time_zone = 'UTC'

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_medvane_session',
    :secret      => '1fae4cf24af0c33db1523629924d416cd57ac73bd5fbef20608d017e743f3f09304f5b955ba0b8c178e61fa7e485dfa267dea1c0fd76e471714309a895daeaab'
  }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  # config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector
end

AUTHOR_ORDER = {
  "one" => "`authors`.one_total desc, `authors`.one_first desc, `authors`.one_last desc, `authors`.one_middle desc, `authors`.last_name desc",
  "five" => "`authors`.five_total desc, `authors`.five_first desc, `authors`.five_last desc, `authors`.five_middle desc, `authors`.last_name desc",
  "ten" => "`authors`.ten_total desc, `authors`.ten_first desc, `authors`.ten_last desc, `authors`.ten_middle desc, `authors`.last_name desc",
  "all" => "`authors`.all_total desc, `authors`.all_first desc, `authors`.all_last desc, `authors`.all_middle desc, `authors`.last_name desc"

}

SUBJECT_ORDER = {
  "one" => "`subjects`.one_major desc, `subjects`.one_total desc",
  "five" => "`subjects`.five_major desc, `subjects`.five_total desc",
  "ten" => "`subjects`.ten_major desc, `subjects`.ten_total desc",
  "all" => "`subjects`.all_major desc, `subjects`.all_total desc" 
}

ARTICLES_IN_MEMBER_PAGE = 6
