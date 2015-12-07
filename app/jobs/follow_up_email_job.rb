class FollowUpEmailJob < ActiveJob::Base
  @queue_as = :user

  def self.perform(user)
    UserMailer.follow_up_email(user).deliver_now
  end
end
