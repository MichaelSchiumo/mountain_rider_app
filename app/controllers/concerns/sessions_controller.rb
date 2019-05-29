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

  def create
    @user = User.find_or_create_by(:uid => auth['uid']) do |u|
      u.name = auth['info']['name']
    end
    session[:user_id] = @user.id
    render 'welcome/home'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
