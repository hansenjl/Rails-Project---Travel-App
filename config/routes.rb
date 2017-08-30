Rails.application.routes.draw do
  resources :countries
  resources :reviews
  resources :visits
  resources :cities
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
