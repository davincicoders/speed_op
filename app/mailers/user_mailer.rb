class UserMailer < ActionMailer::Base
  default from: 'info@speedop.com'

  def digest_email_update(user)
    @user = user
    @url = 'http://speedop.com'
    attachments['Speed OP.docx'] = File.read('app/assets/files/Speed OP.docx')
    attachments.inline['666.txt'] = File.read('app/assets/files/666.txt')
    attachments.inline['octocat.png'] = File.read('app/assets/images/octocat.png')
    mail(to: @user.email,
         # bcc: 'info@speedop.com',
         bcc: 'sergeyskumatov@aol.com',
         subject: 'testing automated email service')
  end
end

