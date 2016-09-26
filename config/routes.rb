Rails.application.routes.draw do

  get '/users' => "users#index"

# Enable nested routes, e.g. /trips/1/accommodations
  resources :trips do
    resources :accommodations, :transits, :events
  end

  # e
  resources :accommodations
  resources :transits
  resources :events


  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  root 'welcome#index'
end
