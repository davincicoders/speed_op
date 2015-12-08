class Site < ActiveRecord::Base
  belongs_to :user

  has_many :webstats

  after_save :update_score

  validates_format_of :url, :with => URI::regexp(%w(http https)),
    :message => 'Please include http:// before the domain name.'

  def update_score
    ps_d = Pagespeed.new(self)
    ps_m = Pagespeed.new(self, true)
    self.webstats.create(
      pull_date: Time.zone.now,
      desktop_score: ps_d.speed,
      mobile_score: ps_m.speed,
      mobile_usability: ps_m.usability
    )

  end

  def self.update_scores
    all.each do |site|
      site.update_score
    end
  end

  def current_mobile_score
    webstats.order(:pull_date).last.mobile_score
  end
end
