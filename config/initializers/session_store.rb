# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_xcell2_session',
  :secret      => '678859a09000168d7dad99e85a835f8ef33bee6ec68401f2530ef0636fa85145a33c3eebde598f719001d52b5ea736e6247a6d6858f547d2584389ff7f24447d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
