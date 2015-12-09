class Site < ActiveRecord::Base
  belongs_to :user

  has_many :webstats
  has_many :desktop_issues, class_name: 'Issues::Desktop'
  has_many :mobile_issues, class_name: 'Issues::Mobile'
  has_many :issues

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
