class SessionsController < ApplicationController


  def welcome

  end

  def home
  end

  def new
    if current_rider
      redirect_to '/'
    else
      @rider = Rider.new
    end
  end

  def login
    @rider = Rider.find_by(:name => params[:rider][:name])
    if @rider && @rider.authenticate(params[:rider][:password])
      session[:rider_id] = @rider.id
      redirect_to mountains_path
    else
      render :new
    end
  end

  def logout
    session.delete :rider_id
    redirect_to root_path
  end

  def google

    @rider = Rider.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
    end
      session[:rider_id] = @rider.id
      redirect_to mountains_path

    #find the correct path
    #riders create and sessions create route to the same place (trails index)
    # redirect_to trails_index
  end

  def logout
    if session[:rider_id]
      session.clear
      redirect_to root_path
    else
      redirect_to home_path
    end
  end

  # def create
  # end

  private

  def auth
    request.env['omniauth.auth']
  end
end
