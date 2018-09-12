class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Your account has been successfully created!"
      render 'new'
    else
      render 'new'
    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end