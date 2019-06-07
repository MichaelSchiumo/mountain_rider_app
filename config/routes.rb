Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :mountains do
    resources :trails, only: [:new, :create, :index]
  end

root 'sessions#welcome'

  # home_path
 get '/home' => 'sessions#home'

 # login_path
 get '/login' => 'sessions#new'

 # create_path
 post '/login' => 'sessions#login'

 # logout_path
 get '/logout' => 'sessions#logout'

 # ominauth through facebook
 get '/auth/google_oauth2/callback' => 'sessions#google'



  resources :riders
  resources :sessions
  resources :trails, only: [:update, :edit, :destroy, :index, :create]
end
