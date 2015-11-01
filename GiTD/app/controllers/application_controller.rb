class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  helper_method :request_count
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  def request_count
    if current_user
      current_user.pending_friend_requests_from.map(&:user).size
    end
  end
end
