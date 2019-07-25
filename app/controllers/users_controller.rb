class UsersController < ApplicationController
  def new
    if logged_in?
      flash[:info] = "You are already logged in!"
      redirect_to posts_url and return
    end
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
