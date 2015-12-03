# namespace :speedopmailinglist do
#   desc 'Email statistics to users'
#   task weekly_report: :environment do
#     file "Speed OP.txt" => "speed_op/app/assets/files/" do
#       sh "echo 'Hello' > 'speed_op/app/assets/files/Speed OP.txt'"
#     week = ENV['week'].to_i || Time.now.week.month
#     puts "Generate weekly report"
#     # TpsWorker.export_csv(week)
#     ContactMailer.speedopmailinglist(week).deliver
#   end
#   end
#   end

# namespace :mailme do
#   desc 'Email statistics to users'
#   task send_email: :environment do
#     accounts_for_delivery = User.where(condition: true)
#     # ... whatever logic you need
#
#     accounts_for_delivery.each do |user|
#   UserMailer.deliver_weekly_report(user).deliver
#   end
#   end
#   end

# namespace :send_digest_email do
  desc 'send digest email'
  task send_digest_email: :environment do
    User.find_each do |user|
      UserMailer.digest_email_update(user).deliver_now
    end
end
