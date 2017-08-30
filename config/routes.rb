Rails.application.routes.draw do
  root 'cities#index'

  resources :countries
  resources :sessions
  resources :visits
  resources :cities do
    resources :reviews
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
