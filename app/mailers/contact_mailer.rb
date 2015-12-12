class ContactMailer < ActionMailer::Base
  default from: "info@speedop.com"

  def welcome_email(contact)
    @contact = contact
    @url = 'http://speedop.com'
    attachments['Speed OP.docx'] = File.read('app/assets/files/Speed OP.docx')
    # attachments.inline['ie-1-1.gif'] = File.read('app/assets/images/ie-1-1.gif')
    mail(to: @contact.email,
         bcc: 'sergey_skumatov@hotmail.com',
         subject: 'Testing the FORM_contact_mailer')
  end
end
