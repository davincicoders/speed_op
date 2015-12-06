class SessionsController < ApplicationController
  # conveniently provides all hash info from omniauth
  def hash_info
    render text: request.env['omniauth.auth'].to_yaml
  end

  # creates a session to authenticate
  def create
    begin
      # uses from_omniauth method that we create
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
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
    redirect_to 'https://www.youtube.com/watch?v=oo0d1zTAFKA'
  end
end

