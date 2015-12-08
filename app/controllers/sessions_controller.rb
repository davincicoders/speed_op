class SessionsController < ApplicationController

  # creates a session to authenticate

  def index
    render text: request.env['omniauth.auth'].to_yaml
    redirect_to index
  end

  def create
    begin
      # uses from_omniauth method that we create
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
      @user.omniauth = true
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to signup_path
  end



  # destroys the session by getting rid of the user id
  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'See you!'
    end
    redirect_to root_path
  end

  def auth_failure
    redirect_to 'http://www.angelfire.com/super/badwebs/'
  end

  def login
  end

  # private
  # def omniauth_options
  #   if auth_hash = request.env['omniauth.auth']
  #     first_name, last_name = auth_hash[:info][:name].split(/\s+/, 2)
  #     {
  #       email: auth_hash[:info][:email],
  #       first_name: first_name,
  #       last_name: last_name,
  #       omniauth: true
  #     }
  #   end
  # end
end

