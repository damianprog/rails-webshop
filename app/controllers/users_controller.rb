class UsersController < ApplicationController
  before_action :set_user, only: [:edit,:update,:show]
  before_action :require_same_user, only: [:edit,:update,:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @cart = Cart.new
    @cart.user = current_user
    @cart.save

    if @user.save
      flash.now[:success] = "Your account has been successfully created!"
      render 'new'
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Your account has been updated'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "You don't have access to this page"
      redirect_to root_path
    end
  end

end