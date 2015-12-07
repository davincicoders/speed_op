class FollowUpEmailJob < ActiveJob::Base
  @queue = :email

  def self.perform(email)
    Resque.enqueue_in(30.seconds, FollowUpEmailJob)
    UserMailer.follow_up_email(email).deliver_now
  end
end
