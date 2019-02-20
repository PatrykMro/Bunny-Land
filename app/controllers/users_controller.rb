class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update]

  def show
    @user = User.friendly.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(user_params)
      sign_in(current_user, bypass: true)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end

end
