Rails.application.routes.draw do

  get '/users' => "users#index"

# This was all added by Nick -- not sure if this works
  resources :trips do
    resources :accommodations, :transit, :events
  end


  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  root 'welcome#index'
end
