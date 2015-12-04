# set :output, "viola_lv/workspace/davinci_coders_t3_2015/final_project/speed_op/log/cron.log"
set :output, "/log/cron.log"

every 5.minutes do # Many shortcuts available: :hour, :day, :month, :year, :reboot
  # rake 'send_digest_email', :environment => :development, :output => {:error => 'log/error.log', :standard => 'log/cron.log'}
  rake 'send_digest_email', :environment => :production
  # rake 'files'

  # rake 'send_digest_email', :output => {:error => 'log/error.log', :standard => 'log/cron.log'}
end
