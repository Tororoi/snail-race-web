Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :snails
  resources :races, only: [:index, :new, :show, :create]
  resources :users, only: [:new, :show, :create, :destroy]
  resources :login, only: [:new, :create]
  resources :bets, only: [:index, :show]

end
