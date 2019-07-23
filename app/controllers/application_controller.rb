# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def log_in(user)
    token = SecureRandom.urlsafe_base64
    cookies.permanent[:sessions] = token
    cookies.permanent[:user_id] = user.id
    digest = Digest::SHA1.hexdigest(token)
    user.update_attribute(:remember_token, token)
  end

  def log_out(user)
    current_user = nil?
    user.clear.digest
    cookies.clear
  end

  def current_user
    if @current_user.nil?
      user = User.find_by(:id, cookies[:sessions])

      if user
        token = cookies[:sessions]
        if Digest::SHA1.hexdigest(token) == user.remember_token
          @current_user = user
        end
      end
    end
    @current_user
   end

  def current_user=(user)
    @current_user ||= user
  end
end
