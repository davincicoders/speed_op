require 'resque/tasks'
require 'resque/scheduler/tasks'

namespace :resque do
  task :setup => :environment do
    # User.find_each do |user|
    #   UserMailer.send_email(user).deliver_now
    require 'resque'
    require 'resque-scheduler'
  end
end
# end
