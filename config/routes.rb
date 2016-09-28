Rails.application.routes.draw do

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  get "users/:user_id/trips/:id" => "users#trip"
  get "users/:id/trips" => "trips#index"



  get "trips/:id/join" => "trips#join"
  get "trips/:trip_id/events/:id/join" => "events#join"

  get "/users/:user_id/trips/:id/transit/new" => "transit#new"

  # get "trips/new" => "trips#new"

  # resources :users do
  #   resources :trips, shallow: true
  # end
  get '/users/:id/friendships/new' => "friendships#new"
  get '/users/:id/friendships' => "friendships#index"
  resources :friendships

# Enable nested routes, e.g. /trips/1/accommodations
  resources :trips do
    resources :accommodations, :transits, :events, :locations
  end

  resources :accommodations
  resources :transits

  resources :events
  resources :users do 
    resources :friendships, :trips
  end


 
  resources :locations


  root 'welcome#index'
end
