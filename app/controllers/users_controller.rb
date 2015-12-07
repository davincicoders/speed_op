class UsersController < ApplicationController
  def index

  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :password_confirmation,
      :omniauth
    )
  end
end
