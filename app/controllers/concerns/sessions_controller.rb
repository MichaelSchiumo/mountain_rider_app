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

  def google_oauth2_callback
    binding.pry
    @rider = Rider.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end

    session[:rider_id] = @rider.id

    #find the correct path
    #riders create and sessions create route to the same place (trails index)
    redirect_to trails_index
  end

  def create
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
