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
end

