class Site < ActiveRecord::Base
  validates_format_of :url, :with => URI::regexp(%w(http https)),
  :message => 'Please include http:// before the domain name.'
end
