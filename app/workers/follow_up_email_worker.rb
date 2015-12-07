class FollowUpEmailJob < ActiveJob::Base
  queue_as :email

  def perform(email)
    UserMailer.follow_up_email(email).deliver_now
  end
end
