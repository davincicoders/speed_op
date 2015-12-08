# require 'resque-scheduler'
# Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")

Resque.redis = Redis.new(:url => 'redis://localhost:6379')
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }

