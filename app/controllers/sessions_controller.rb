# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = current_user
  end

  def create
    @user = User.find_by(email: params[:sessions][:email].downcase)

    log_in @user if @user&.authenticate(params[:sessions][:password])
  end

  def destroy
    @user = current_user
    log_out @user
  end
end
