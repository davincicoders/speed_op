class FollowUpEmailWorker < ActiveJob::Base
  @queue = :email

  def self.perform(email)
    UserMailer.follow_up_email(email).deliver_now
  end
end
