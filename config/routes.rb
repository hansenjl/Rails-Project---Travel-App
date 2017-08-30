Rails.application.routes.draw do
  root 'cities#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :countries
  resources :visits
  resources :cities do
    resources :reviews
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
