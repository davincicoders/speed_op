class UserMailer < ActionMailer::Base
  default from: 'speedopdavinci@gmail.com'

  def digest_email_update(user)
    @user = user
    @url = 'http://speedop.com'
    attachments['Speed OP.docx'] = File.read('app/assets/files/Speed OP.docx')
    attachments.inline['666.txt'] = File.read('app/assets/files/666.txt')
    attachments.inline['octocat.png'] = File.read('app/assets/images/octocat.png')
    mail(to: @user.email,
         bcc: 'speedopdavinci@gmail.com',
         subject: 'test welcome email')
  end
end
