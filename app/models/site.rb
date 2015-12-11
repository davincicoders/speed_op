class Site < ActiveRecord::Base
  belongs_to :user

  has_many :webstats
  has_many :desktop_issues, class_name: 'Issues::Desktop'
  has_many :mobile_issues, class_name: 'Issues::Mobile'
  has_many :issues

  after_save :update_score

  before_validation :smart_add_url_protocol

  def smart_add_url_protocol
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
      self.url = "http://#{self.url}"
    end
  end

  def load_time
    require 'open-uri'
    require 'date'
    start = Time.new
    open(self.url).read
    stop = Time.new
    return ((stop - start) * 1000).to_i
  end

  def update_score
    ps_d = Pagespeed.new(self)
    ps_m = Pagespeed.new(self, true)
    self.webstats.create(
      pull_date: Time.zone.now,
      desktop_score: ps_d.speed,
      mobile_score: ps_m.speed,
      mobile_usability: ps_m.usability
    )

    expire_issues

    ps_d.rule_result_keys.each do |key|
      desktop_issues.create(
        score: ps_d.score(key),
        suggestion: ps_d.suggestion(key)
      )
    end

    ps_m.rule_result_keys.each do |key|
      mobile_issues.create(
        score: ps_m.score(key),
        suggestion: ps_m.suggestion(key)
      )
    end
  end

  def expire_issues
    issues.active.update_all(expired_at: Time.now)
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
