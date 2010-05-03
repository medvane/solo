# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"
  config.gem 'mislav-will_paginate', :version => '~> 2.3.11', :lib => 'will_paginate', :source => 'http://gems.github.com'
  config.gem 'mattetti-googlecharts', :version => '~> 1.4.0', :lib => 'gchart', :source => 'http://gems.github.com'

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
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
