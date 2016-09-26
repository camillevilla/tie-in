Rails.application.routes.draw do
  get 'trips' => "trips#index"

  get 'trips/show'

  get '/users' => "users#index"

  post '/trips' => "trips#create"

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  root 'welcome#index'
end
