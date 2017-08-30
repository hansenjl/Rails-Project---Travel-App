Rails.application.routes.draw do
  root 'cities#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'

  get '/auth/facebook/callback' => 'sessions#fbcreate'

  resources :countries
  resources :visits
  resources :cities
  resources :users  do
    resources :wishlists
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
