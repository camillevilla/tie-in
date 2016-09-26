Rails.application.routes.draw do
  get '/users' => "users#index"
  get '/users/:id/friendships' => "friendships#index"
  resources :friendships


# Enable nested routes, e.g. /trips/1/accommodations
  resources :trips do
    resources :accommodations, :transits, :events
  end

  # e
  resources :accommodations
  resources :transits
  resources :events
  resources :users

  root 'welcome#index'
end
