Rails.application.routes.draw do
<<<<<<< HEAD
  get 'trips' => "trips#index"

  get '/users' => "users#index"

  post '/trips' => "trips#create"
=======

  get '/users' => "users#index"

# Enable nested routes, e.g. /trips/1/accommodations
  resources :trips do
    resources :accommodations, :transits, :events
  end

  # e
  resources :accommodations
  resources :transits
  resources :events

>>>>>>> 8de6a45ad82c95c86ac3f3dd8d3036df76c20ccf

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  root 'welcome#index'
end
