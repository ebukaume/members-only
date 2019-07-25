class UsersController < ApplicationController
  before_action :require_not_logged_in, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      current_user = @user
      flash[:success] = 'Welcome, you are now a member!'
      redirect_to root_path
    else
      flash.now[:danger] = 'Sign up failed!'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
