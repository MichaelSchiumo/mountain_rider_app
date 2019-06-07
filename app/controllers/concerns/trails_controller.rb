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
    @trail = Trail.new(trail_params)
    if @trail.save
      redirect_to trail_path(@trail)
    else
      render :new
    end
  end

  # def create
  #   @mountain = Mountain.find(params[:mountain_id])
  #   @trail = @mountain.trails.new(trail_params)
  #   @trail.rider = current_user
  #   @trail.save
  #   redirect_to trail_path(@trail)
  # end

  # def create
  #   @trail = Trail.new(trail_params)
  #   if @trail.save
  #     redirect_to trail_path(@trail)
  #   else
  #     render :new
  #   end
  # end

  def edit
    @trail = Trail.find_by(id: params[:id])
  end  

  def show
    @trail = Trail.find_by(id: params[:id])
  end

  def update
    @trail = Trail.find(params[:id])
    @trail.update(trail_params)
    if @trail.save
      redirect_to trail_path(@trail)
    else
      render :edit
    end
  end

  private

  def trail_params
    params.require(:trail).permit(:name, :id)
  end
end
