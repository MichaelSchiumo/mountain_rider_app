class TrailsController < ApplicationController

  def create
    @trail = Trail.new(trail_params)
    @rider = Rider.find(trail_params[:rider_id])
    @mountain = Mountain.find(trail_params[:mountain_id])
    redirect_to rider_path(@rider)
  end

  private

  def trail_params
    params.permit(:rider_id, :mountain_id)
  end  
end
