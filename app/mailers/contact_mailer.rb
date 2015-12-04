class ContactMailer < ActionMailer::Base
  default from: "no-reply@gmail.com"

  def welcome_email(contact)
    @contact = contact
    # @url = 'http://www.google.com'
    attachments['Speed OP.docx'] = File.read('app/assets/files/Speed OP.docx')
    mail(to: @contact.email, bcc: 'speedopdavinci@gmail.com', subject: 'test welcome email', reply_to: 'no-reply@gmail.com')

    # format.html { render html: 'welcome_email'}
    # format.text { render text: 'Get a real mail client!'}

    # attachments['Speed OP.docx'] = File.read('/app/assets/files/Speed OP.docx')
    # attachment :content_type => "images/jpeg",
    #   :body => File.read("octocat.jpeg")
  end
end
