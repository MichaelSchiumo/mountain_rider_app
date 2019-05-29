class SessionsController < ApplicationController


  def welcome
  end

  def home
  end

  def new
    if current_user
      redirect_to '/'
    else
      @rider = Rider.new
    end
  end

  def login
    @rider = Rider.find_by(:name => params[:rider][:name])
    if @rider && @rider.authenticate(params[:rider][:password])
      @rider.save
      session[:rider_id] = rider.id
      redirect_to rider_path(rider)
    else
      redirect_to login_path
    end
  end

  def destroy
    if current_user
      session.delete :rider_id
      redirect_to root_path
    end
  end
end
