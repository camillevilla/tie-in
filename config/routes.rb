Rails.application.routes.draw do

  get "users/:id/trips" => "trips#index"

  resources :users do
    resources :trips, shallow: true
  end

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
