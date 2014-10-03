Rails.application.routes.draw do
  root 'players#new'
  resources :players, only: [:new, :create]
  resources :boards,  only: [:index, :show]
  resources :scores,  only: :show
  get '/check_character', to: 'boards#check_character'
end
