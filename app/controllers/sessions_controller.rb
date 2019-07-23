# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = current_user
  end

  def create
    @user = User.find_by(email: params[:sessions][:email].downcase)

    if @user&.authenticate(params[:sessions][:password])
      log_in @user
      flash[:success] = 'Logged'
    else
      flash.now[:danger] = 'Invalid email/password combination'
  end
  end

  def destroy
    @user = current_user
    log_out @user
  end
end
