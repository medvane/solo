# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_medvane_session',
  :secret      => '3883e70ac15e3c2b855ac5d568e5f794ea4209629147042e0fae85c03f72a296f561000c99966dcc4756c8bd452d27ef9aaebc0146695b70e105fe553994efc0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
