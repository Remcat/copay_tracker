Dev::Application.routes.draw do
  resources :insurance_providers

  resources :users

  resources :appointments

  resources :clients

  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  match '/search', 	to: 'application#index',	via: 'get',		as: 'search'

  root :to => 'sessions#new'
end
