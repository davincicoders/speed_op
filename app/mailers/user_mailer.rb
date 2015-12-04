class UserMailer < ActionMailer::Base
  default from: 'speedopdavinci@gmail.com'

  def digest_email_update(user)
    @user = user
    @url = 'http://www.google.com'
    attachments['Speed OP.docx'] = File.read('app/assets/files/Speed OP.docx')
    mail(to: @user.email, bcc: 'speedopdavinci@gmail.com', subject: 'test welcome email', body: 'no-reply@gmail.com')

    end

end
