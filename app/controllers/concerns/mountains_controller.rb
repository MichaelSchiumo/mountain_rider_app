class MountainsController < ApplicationController
  before_action :find_mountain, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def index
    @mountains = Mountain.all
  end

  def new
    @mountain = Mountain.new
  end

  def create
    @mountain = Mountain.create(mountain_params)
    if @mountain
      redirect_to mountain_path(@mountain)
    else
      render :new
    end
  end

  def update
    @mountain.update(mountain_params)
    if @mountain.save
      redirect_to mountain_path(@mountain)
    else
      render :edit
    end
  end

  def destroy
    @mountain.destroy
    flash[:message] = "Mountain successfully deleted."
    redirect_to mountain_path
  end

  private

  def mountain_params
    params.require(:mountain).permit(:name, :difficulty, :rank)
  end

  def find_mountain
    @mountain = Mountain.find_by(id: params[:id])
  end

end
