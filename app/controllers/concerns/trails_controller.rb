class TrailsController < ApplicationController

  def new
    @trail = Trail.new(mountain_id: params[:mountain_id])
  end

  def index
    if params[:mountain_id]
      mountain = Mountain.find_by(id: params[:mountain_id])
      @trails = mountain.trails
    else
      @trails = Trail.all
    end
  end

  def create
    @mountain = Mountain.find(params[:mountain_id])
    @trail = @mountain.trails.build(trail_params)
    @trail.rider = current_user
    redirect_to trail_path(@trail)
  end

   

  private

  def trail_params
    params.require(:trail).permit(:name)
  end
end
