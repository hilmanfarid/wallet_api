# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

require_all "app/*.rb"
require_all "app/*/*.rb"
require_all "app/*/*/*.rb"
