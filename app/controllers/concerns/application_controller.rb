class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login, :admin_only

  def current_rider
    if session[:rider_id].present?
      rider = Rider.find_by(:id => session[:rider_id])
    end
  end

  def require_login
    unless current_user
      redirect_to root_path
    end
  end

  def admin_only
    unless current_user.admin
      flash[:notice] = "You must be an admin to access this page."
      redirect_to rider_path(current_user)
    end
  end
end
