class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # Preventing current_user to log in again, a before filter
  def require_logout
    redirect_to :back, notice: 'Already logged in!' if current_user
  end

  # Callback method for not authenticated user
  def not_authenticated
    redirect_to login_path, notice: 'Please login to access this page.'
  end
end
