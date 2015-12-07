class UsersController < ApplicationController
  def index
end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    FollowUpEmailJob.new(@user.email).enqueue(wait: 2.seconds)

    if @user.save
      redirect_to root_path,
        notice: "Welcome to Speed Op #{@user.first_name.titleize} "
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :password_confirmation,
      :omniauth
    )
  end
end
