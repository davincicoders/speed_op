class Site < ActiveRecord::Base
  belongs_to :user

  has_many :webstats
  has_many :issues

  after_save :update_score

  before_validation :smart_add_url_protocol

  def smart_add_url_protocol
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
      self.url = "http://#{self.url}"
    end
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
    self.issues.create(
      avoid_redirects_impact_m: ps_m.pagespeed_rule_impact('AvoidLandingPageRedirects'),
      avoid_redirects_summary_m: ps_m.pagespeed_rule_summary('AvoidLandingPageRedirects'),
      avoid_redirects_impact_d: ps_d.pagespeed_rule_impact('AvoidLandingPageRedirects'),
      avoid_redirects_summary_d: ps_d.pagespeed_rule_summary('AvoidLandingPageRedirects'),
      enable_compression_impact_m: ps_m.pagespeed_rule_impact('EnableGzipCompression'),
      enable_compression_summary_m: ps_m.pagespeed_rule_summary('EnableGzipCompression'),
      enable_compression_impact_d: ps_d.pagespeed_rule_impact('EnableGzipCompression'),
      enable_compression_summary_d: ps_d.pagespeed_rule_summary('EnableGzipCompression'),
      response_time_impact_m: ps_m.pagespeed_rule_impact('MainResourceServerResponseTime'),
      response_time_summary_m: ps_m.pagespeed_rule_summary('MainResourceServerResponseTime'),
      response_time_impact_d: ps_d.pagespeed_rule_impact('MainResourceServerResponseTime'),
      response_time_summary_d: ps_d.pagespeed_rule_summary('MainResourceServerResponseTime'),
      browser_caching_impact_m: ps_m.pagespeed_rule_impact('LeverageBrowserCaching'),
      browser_caching_summary_m: ps_m.pagespeed_rule_summary('LeverageBrowserCaching'),
      browser_caching_impact_d: ps_d.pagespeed_rule_impact('LeverageBrowserCaching'),
      browser_caching_summary_d: ps_d.pagespeed_rule_summary('LeverageBrowserCaching'),
      minify_javaScript_impact_m: ps_m.pagespeed_rule_impact('MinifyJavaScript'),
      minify_javaScript_summary_m: ps_m.pagespeed_rule_summary('MinifyJavaScript'),
      minify_javaScript_impact_d: ps_d.pagespeed_rule_impact('MinifyJavaScript'),
      minify_javaScript_summary_d: ps_d.pagespeed_rule_summary('MinifyJavaScript'),
      minify_html_impact_m: ps_m.pagespeed_rule_impact('MinifyHTML'),
      minify_html_summary_m: ps_m.pagespeed_rule_summary('MinifyHTML'),
      minify_html_impact_d: ps_d.pagespeed_rule_impact('MinifyHTML'),
      minify_html_summary_d: ps_d.pagespeed_rule_summary('MinifyHTML'),
      minify_css_impact_m: ps_m.pagespeed_rule_impact('MinifyCss'),
      minify_css_summary_m: ps_m.pagespeed_rule_summary('MinifyCss'),
      minify_css_impact_d: ps_d.pagespeed_rule_impact('MinifyCss'),
      minify_css_summary_d: ps_d.pagespeed_rule_summary('MinifyCss'),
      optimize_images_impact_m: ps_m.pagespeed_rule_impact('OptimizeImages'),
      optimize_images_summary_m: ps_m.pagespeed_rule_summary('OptimizeImages'),
      optimize_images_impact_d: ps_d.pagespeed_rule_impact('OptimizeImages'),
      optimize_images_summary_d: ps_d.pagespeed_rule_summary('OptimizeImages'),
      visible_content_impact_m: ps_m.pagespeed_rule_impact('PrioritizeVisibleContent'),
      visible_content_summary_m: ps_m.pagespeed_rule_summary('PrioritizeVisibleContent'),
      visible_content_impact_d: ps_d.pagespeed_rule_impact('PrioritizeVisibleContent'),
      visible_content_summary_d: ps_d.pagespeed_rule_summary('PrioritizeVisibleContent'),
      minimize_blocking_impact_m: ps_m.pagespeed_rule_impact('MinimizeRenderBlockingResources'),
      minimize_blocking_summary_m: ps_m.pagespeed_rule_summary('MinimizeRenderBlockingResources'),
      minimize_blocking_impact_d: ps_d.pagespeed_rule_impact('MinimizeRenderBlockingResources'),
      minimize_blocking_summary_d: ps_d.pagespeed_rule_summary('MinimizeRenderBlockingResources'),
      avoid_plugins_impact_m: ps_m.pagespeed_rule_impact('AvoidPlugins'),
      avoid_plugins_summary_m: ps_m.pagespeed_rule_impact('AvoidPlugins'),
      configure_viewport_impact_m: ps_m.pagespeed_rule_impact('ConfigureViewport'),
      configure_viewport_summary_m: ps_m.pagespeed_rule_summary('ConfigureViewport'),
      size_content_impact_m: ps_m.pagespeed_rule_impact('SizeContentToViewport'),
      size_content_summary_m: ps_m.pagespeed_rule_summary('SizeContentToViewport'),
      size_tap_targets_impact_m: ps_m.pagespeed_rule_impact('SizeTapTargetsAppropriately'),
      size_tap_targets_summary_m: ps_m.pagespeed_rule_summary('SizeTapTargetsAppropriately'),
      legible_font_size_impact_m: ps_m.pagespeed_rule_impact('UseLegibleFontSizes'),
      legible_font_size_summary_m: ps_m.pagespeed_rule_summary('UseLegibleFontSizes')
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
