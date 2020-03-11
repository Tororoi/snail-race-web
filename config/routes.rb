Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :snails
  resources :races, only: [:index, :new, :show, :create]
  resources :users, only: [:new, :show, :create, :update, :destroy]
  resources :login, only: [:new, :create]
  resources :bets, only: [:index, :show, :create, :destroy]
  resources :snail_races, only: [:create]
  root :to => 'static#index' 

  get '/races/:id/run', to: 'races#run', as: 'run'

end
