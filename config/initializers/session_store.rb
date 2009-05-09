# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pakistanmap_session',
  :secret      => '682cf30ee78e6bd16083486916607de9ce3f1e68b05734a8422a508e611b553e264e3a03fa7122b26445695a5ae39583f69659cb23708362b7d5efaf9ac64981'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
