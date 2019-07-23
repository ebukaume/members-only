module SessionsHelper
  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= set_current_user(cookies.permanent.signed[:user_id])
  end

  def current_user=(user)
    @current_user = user
  end

  private

  def set_current_user(user_id)
    if user = User.find_by(id: user_id)
      if Digest::SHA1.hexdigest(cookies.permanent[:sessions]) == user.remember_token
        @current_user = user
      end
    end
  end
end
