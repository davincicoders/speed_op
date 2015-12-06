class SessionsController < ApplicationController

  def login
  end

  def oauth
    @user = User.where(
      email: omniauth_options[:email]
    ).first_or_initialize(omniauth_options)
    if @user.persisted?
      session[:id] = @user.id
      redirect_to root_path,
                  notice: "Welcome back #{@user.first_name.titleize}
                  #{@user.last_name}!"
    else
      render 'users/new'
    end
  end

  layout false
  #
  def new
  end
  #
  # def create
  #   @auth = request.env['omniauth.auth']['credentials']
  # end

  #  def create
  #    user = User.find_by_email(params[:email])
  #    if user && user.authenticate(params[:password])
  #      # User provided valid auth creds
  #      session[:id] = user.id
  #      redirect_to root_path, notice: "Welcome back #{user.first_name.titleize}
  # #{user.last_name.titleize}!"
  #    else
  #      # User provided invalid creds
  #      flash[:error] = 'Invalid credentials'
  #      render :login
  #    end
  #  end


  def create
    auth = request.env['omniauth.auth']
    # Find an identity here
    @identity = Identity.find_with_omniauth(auth)

    if @identity.nil?
      # If no identity was found, create a brand new one here
      @identity = Identity.create_with_omniauth(auth)
    end

    if signed_in?
      if @identity.user == current_user
        # User is signed in so they are trying to link an identity with their
        # account. But we found the identity and the user associated with it
        # is the current user. So the identity is already associated with
        # this user. So let's display an error message.
        redirect_to root_url, notice: "Already linked that account!"
      else
        # The identity is not associated with the current_user so lets
        # associate the identity
        @identity.user = current_user
        @identity.save()
        redirect_to root_url, notice: "Successfully linked that account!"
      end
    else
      if @identity.user.present?
        # The identity we found had a user associated with it so let's
        # just log them in here
        self.current_user = @identity.user
        redirect_to root_url, notice: "Signed in!"
      else
        # No user associated with the identity so we need to create a new one
        redirect_to new_user_url, notice: "Please finish registering"
      end
    end
  end



  # def destroy
  #   if user = current_user
  #     session.delete(:id)
  #     redirect_to root_path, notice: "#{user.email} has been logged out"
  #   end
  # end

  def destroy
    self.current_user = nil
    redirect_to root_url, notice: "Signed out!"
  end

  private
  def omniauth_options
    if auth_hash = request.env['omniauth.auth']
      first_name, last_name = auth_hash[:info][:name].split(/\s+/, 2)
      {
        first_name: first_name,
        last_name: last_name,
        email: auth_hash[:info][:email],
        omniauth: true
      }
    end
  end
end
