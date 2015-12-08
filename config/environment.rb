# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.delivery_method = :smtp
DEFAULT_FROM = "no-reply@gmail.com"

# config.gem "whenever",
#            :lib => false,
#            :source => "http://gemcutter.org&#8217"
