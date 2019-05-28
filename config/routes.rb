Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :mountains do
    resources :trails, only: [:new, :create, :index]
  end

  root "static_pages#home"
  resources :riders
  resources :sessions
  resources :trails, only: [:update, :edit, :destroy]
end
