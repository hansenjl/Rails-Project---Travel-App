Rails.application.routes.draw do
  root 'sessions#welcome'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get 'countries/most_visited' => 'countries#most_visited'
  post '/comments' => 'comments#create'

  get '/auth/facebook/callback' => 'sessions#fbcreate'

  resources :countries
  resources :cities
  resources :users  do
    resources :visits
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
