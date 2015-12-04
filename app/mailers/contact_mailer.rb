class ContactMailer < ActionMailer::Base
  default from: "no-reply@gmail.com"

  def welcome_email(contact)
    @contact = contact
    @url = 'http://www.google.com'
    attachments['Speed OP.docx'] = File.read('app/assets/files/Speed OP.docx')
    mail(to: @contact.email, bcc: 'speedopdavinci@gmail.com', subject: 'test welcome email', body: 'no-reply@gmail.com')

  end
  end
