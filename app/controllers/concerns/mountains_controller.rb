class MountainsController < ApplicationController

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

end
