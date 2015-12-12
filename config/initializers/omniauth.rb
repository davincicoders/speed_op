OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_ID'], ENV['TWITTER_SECRET']

  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET'],
    scope: 'public_profile', info_fields: 'id,name,link,email'

  provider :github, ENV['GITHUB_ID2'], ENV['GITHUB_SECRET2'],
    scope: 'user', image_aspect_ratio: 'square', image_size: 48

  provider :linkedin, ENV['LINKEDIN_ID'], ENV['LINKEDIN_SECRET'],
    scope: 'r_basicprofile r_emailaddress',
    fields: ['id', 'email-address', 'first-name', 'last-name', 'location',
      'picture-url',
      'public-profile-url']

  provider :google_oauth2, ENV['GOOGLE_ID'], ENV['GOOGLE_SECRET'], {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}},
      scope: "email", image_aspect_ratio: 'square', image_size: 48,
      access_type: 'online', name: 'google',
      setup: (lambda do |env|
        request = Rack::Request.new(env)
        env['omniauth.strategy'].options['token_params'] = {:redirect_uri => 'http://127.0.0.1:3000/auth/google/callback'}
      end)}

# tell omniauth to have the sessions controller direct in case of a failures
OmniAuth.config.on_failure = Proc.new do |env|
  SessionsController.action(:auth_failure).call(env)
end

 # OmniAuth.config.full_host = 'http://127.0.0.1:3000'

 OmniAuth.config.full_host = 'http://127.0.0.1:3000'
end


