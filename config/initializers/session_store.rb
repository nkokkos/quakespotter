# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_quake3_session',
  :secret      => 'dbc490d63af1cf25eab58fb1bb880dd24bc9e2d6baf708356a41536f0e5ead69899a7cac725a920eb2af53e0f15d089235eaf8346e83bdcfee9ab943066408b2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
