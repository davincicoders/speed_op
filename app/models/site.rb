class Site < ActiveRecord::Base
  belongs_to :user

  has_many :pagespeeds

  validates_format_of :url, :with => URI::regexp(%w(http https)),
  :message => 'Please include http:// before the domain name.'
end
