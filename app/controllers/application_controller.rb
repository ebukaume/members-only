# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  def log_in(user)
    token = SecureRandom.urlsafe_base64
    cookies.permanent[:sessions] = token
    cookies.permanent.signed[:user_id] = user.id
    digest = Digest::SHA1.hexdigest(token)
    user.update_attribute(:remember_token, digest)
  end

  def log_out
    current_user = nil
    cookies.delete(:user_id)
  end

  def require_login
    redirect_to sign_in_url unless logged_in?
  end
end
