class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :site_id
      t.float :avoid_redirects_impact_m
      t.string :avoid_redirects_summary_m
      t.float :avoid_redirects_impact_d
      t.string :avoid_redirects_summary_d
      t.float :enable_compression_impact_m
      t.string :enable_compression_summary_m
      t.float :enable_compression_impact_d
      t.string :enable_compression_summary_d
      t.float :response_time_impact_m
      t.string :response_time_summary_m
      t.float :response_time_impact_d
      t.string :response_time_summary_d
      t.float :browser_caching_impact_m
      t.string :browser_caching_summary_m
      t.float :browser_caching_impact_d
      t.string :browser_caching_summary_d
      t.float :minify_javaScript_impact_m
      t.string :minify_javaScript_summary_m
      t.float :minify_javaScript_impact_d
      t.string :minify_javaScript_summary_d
      t.float :minify_html_impact_m
      t.string :minify_html_summary_m
      t.float :minify_html_impact_d
      t.string :minify_html_summary_d
      t.float :minify_css_impact_m
      t.string :minify_css_summary_m
      t.float :minify_css_impact_d
      t.string :minify_css_summary_d
      t.float :optimize_images_impact_m
      t.string :optimize_images_summary_m
      t.float :optimize_images_impact_d
      t.string :optimize_images_summary_d
      t.float :visible_content_impact_m
      t.string :visible_content_summary_m
      t.float :visible_content_impact_d
      t.string :visible_content_summary_d
      t.float :minimize_blocking_impact_m
      t.string :minimize_blocking_summary_m
      t.float :minimize_blocking_impact_d
      t.string :minimize_blocking_summary_d
      t.float :avoid_plugins_impact_m
      t.string :avoid_plugins_summary_m
      t.float :configure_viewport_impact_m
      t.string :configure_viewport_summary_m
      t.float :size_content_impact_m
      t.string :size_content_summary_m
      t.float :size_tap_targets_impact_m
      t.string :size_tap_targets_summary_m
      t.float :legible_font_size_impact_m
      t.string :legible_font_size_summary_m

      t.timestamps null: false
    end
  end
end
