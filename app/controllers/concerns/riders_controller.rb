class RidersController < ApplicationController

  def new
    @rider = Rider.new
  end

  def create
    @rider = Rider.new(rider_params)
    if @rider.save
      session[:id] = @rider.id
      redirect_to rider_path(@rider)
    else
      render :new
    end
  end

  def show
    @rider = Rider.find_by(:id => params[:id])
  end


  private

  def rider_params
    params.require(:rider).permit(:name, :password, :experience, :stance, :ticket_number, :admin)
  end
end
