class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
    # if @contact.save
    #   redirect_to(@user, :notice => 'User created')
      # flash[:notice] = 'Thank you for your message. We will contact you soon!'
      redirect_to root_path, notice:'Thank you for your message. We will contact you soon!'

      ContactMailer.welcome_email(@contact).deliver
    else
      flash[:error] = 'Cannot send message.'
      render :new
    end
  end
end
