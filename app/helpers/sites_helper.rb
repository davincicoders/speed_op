module SitesHelper
  def up_down(current, previous)
    current = current.to_i
    previous = previous.to_i
    if current > previous
      "up"
    elsif current < previous
      "down"
    else
      "even"
    end
  end

  def stat_call
    @stat_call = @site.webstats.each_with_index
  end

  def mobile_speed
    @mobile_speed ="[Date.UTC(" + stat.pull_date.getlocal.strftime("%Y,%m,%e") + ")," + stat.mobile_score.to_s + "],"
  end

  def minus_one
    (@webstat.pull_date.getlocal.strftime("%m").to_i - 1).to_s
  end

  def mobile_loop
    @site.webstats.each do |stat|
      "[Date.UTC(" + stat.pull_date.getlocal.strftime("%Y, %m, %e") + ")," + stat.mobile_score.to_s + "],".html_safe
    end
  end
end

