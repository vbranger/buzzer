Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :games, only: [:show, :create, :index, :destroy] do
    resources :buzzs, only: :create
  end
  get 'clearbuzzs', to: 'buzzs#clearbuzzs'
  get 'create_new_game', to: 'games#create_new_game'
  get 'find_game', to: 'games#find'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
