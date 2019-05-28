class SessionsController < ApplicationController

  def new
  end

  def create
    rider = Rider.find_by(:name => params[:rider][:name])
    if rider && rider.authenticate(params[:password])
      session[:rider_id] = rider.id
      redirect_to rider_path(rider)
    else
      render :new
    end
  end

  def destroy
    if current_user
      session.delete :rider_id
      redirect_to root_path
    end
  end     
end
