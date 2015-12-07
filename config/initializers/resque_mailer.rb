#config/initializers/active_job.rb

# Resque::Mailer.follow_up_email = 'user_mailer'

ActiveJob::Base.queue_adapter = :resque
