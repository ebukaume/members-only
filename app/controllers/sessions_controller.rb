class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:info] = "You are already logged in!"
      redirect_to posts_url and return
    end
  end

  def create
    @user = User.find_by(email: params[:sessions][:email].downcase)
    if @user&.authenticate(params[:sessions][:password])
      log_in @user
      current_user = @user
      flash[:success] = 'Logged in!'
      redirect_to posts_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out
    redirect_back(fallback_location: posts_url)
  end
end
