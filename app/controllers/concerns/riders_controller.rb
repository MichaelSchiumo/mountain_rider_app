class RidersController < ApplicationController

  def new
    @rider = Rider.new
  end

  def create
    rider = Rider.create(rider_params)
    if rider.valid?
      session[:id] = rider.id
      redirect_to rider_path(rider)
    else
      render :new
    end
  end        
end
