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

  def month_minus
   @month_minus = strftime("%m").to_i - 1
  end
end

