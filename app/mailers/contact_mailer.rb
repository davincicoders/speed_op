class ContactMailer < ActionMailer::Base
  default from: "info@speedop.com"

  def welcome_email(contact)
    @contact = contact
    # @url = 'http://www.google.com'
    attachments['Speed OP.docx'] = File.read('app/assets/files/Speed OP.docx')
    mail(to: @contact.email, bcc: 'info@speedop.com', subject: 'testing responce form', reply_to: 'info@speedop.com')

    # format.html { render html: 'welcome_email'}
    # format.text { render text: 'Get a real mail client!'}

    # attachments['Speed OP.docx'] = File.read('/app/assets/files/Speed OP.docx')
    # attachment :content_type => "images/jpeg",
    #   :body => File.read("octocat.jpeg")
  end
end
