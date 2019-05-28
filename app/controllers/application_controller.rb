class ApplicationController < ActionController::Base


  def current_user
    if session[:rider_id].present?
      rider = Rider.find_by(:id => session[:rider_id])
    end
  end    
end
