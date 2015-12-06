 desc 'send digest email'
  task send_digest_email: :environment do
    User.find_each do |user|
      UserMailer.digest_email_update(user).deliver_now
    end
end
