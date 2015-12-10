class User < ActiveRecord::Base
  has_many :sites

  # find_or_create_by ensures that we don't create the same user
  # multiple times

  # the users token can be accessed by
  # auth_hash['credentials']['token'] (auth_hash['credentials']['secret'])
  
  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
      user.name = auth_hash['info']['name']
      user.email = auth_hash['info']['email']
      user.location = get_social_location_for user.provider, auth_hash['info']['location']
      user.image_url = auth_hash['info']['image']
      user.url = get_social_url_for user.provider, auth_hash['info']['urls']
      user.save!
      user
    end

    # storing info for linkedin is more complicated
    private

    def get_social_location_for(provider, location_hash)
      case provider
        when 'linkedin'
          location_hash['location']
        else
          location_hash
      end
    end

    def get_social_url_for(provider, urls_hash)
      case provider
        when 'linkedin'
          urls_hash['public_profile']
        else
          urls_hash[provider.capitalize]
      end
    end
  end
end

