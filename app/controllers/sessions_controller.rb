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
        #{@user.last_name.titleize}!"
    else
      render 'users/new'
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # User provided valid auth creds
      session[:id] = user.id
      redirect_to root_path, notice: "Welcome back #{user.first_name.titleize}
 #{user.last_name.titleize}!"
    else
      # User provided invalid creds
      flash[:error] = 'Invalid credentials'
      render :login
    end
  end

  def destroy
    if user = current_user
      session.delete(:id)
      redirect_to root_path, notice: "#{user.email} has been logged out"
    end
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
