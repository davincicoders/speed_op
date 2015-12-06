Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_ID'], ENV['TWITTER_SECRET']

  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET'],
    scope: 'public_profile', info_fields: 'id,name,link'

  provider :github, ENV['GITHUB_ID'], ENV['GITHUB_SECRET'],
    scope: 'user', image_aspect_ratio: 'square', image_size: 48

  provider :linkedin, ENV['LINKEDIN_ID'], ENV['LINKEDIN_SECRET'],
    scope: 'r_basicprofile',
    fields: ['id', 'first-name', 'last-name', 'location', 'picture-url', 'public-profile-url']


# Google oauth2 was difficult to get working because I had to provide
# information about the redirect uri
  provider :google_oauth2, ENV['GOOGLE_ID'], ENV['GOOGLE_SECRET'], {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}},
      scope: 'email profile', image_aspect_ratio: 'square', image_size: 48,
      access_type: 'online', name: 'google',
      setup: (lambda do |env|
        request = Rack::Request.new(env)
        env['omniauth.strategy'].options['token_params'] = {:redirect_uri => 'http://dashboard.speedop.com/auth/google/callback'}
      end)}

# tell omniauth to have the sessions controller direct in case of a failures
# OmniAuth.config.on_failure = Proc.new do |env|
#   SessionsController.action(:auth_failure).call(env)
# end

OmniAuth.config.full_host = 'http://dashboard.speedop.com/'


# Check out the tutorial for some info
# https://www.twilio.com/blog/2014/09/gmail-api-oauth-rails.html\
# Authentication with Google provides these tokens, which only last for 60 min
# request.env['credentials']['access_token']
# request.env['credentials']['refresh_token']
# request.env['credentials']['expires_at']

