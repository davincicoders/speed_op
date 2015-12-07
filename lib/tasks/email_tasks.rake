 desc 'send digest email'
  task follow_up_email: :environment do
    User.find_each do |user|
      UserMailer.follow_up_email(user).deliver_now
    end
end
