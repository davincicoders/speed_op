
class FollowUpEmailJob < ActiveJob::Base
  queue_as :email

  def perform(user)
    UserMailer.follow_up_email(user).deliver_now
  end
end
