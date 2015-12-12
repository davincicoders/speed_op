class UserMailer < ActionMailer::Base
  # include Resque::Mailer
  default from: "info@speedop.com"

  def digest_email_update(user)
    @user = user
    @url = 'http://speedop.com'
    attachments['Speed OP.docx'] = File.read('app/assets/files/Speed OP.docx')
    attachments.inline['666.txt'] = File.read('app/assets/files/666.txt')
    # attachments.inline['ie-1-1.gif'] = File.read('app/assets/images/ie-1-1.gif')
    mail(to: @user.email,
         # bcc: 'info@speedop.com',
         bcc: 'sergeyskumatov@gmail.com',
         subject: 'testing automated EMAIL SERVICE')
  end
end

