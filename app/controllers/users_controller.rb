class UsersController < ApplicationController
  def index
end

  def new
    @user = User.new
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :password_confirmation,
      :omniauth
    )
  end
end
