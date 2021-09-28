Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  mount ActionCable.server => '/cable'
  # post 'search_game', to: 'games#find'
  get 'search_game', to: 'games#find'

  resources :games, only: [:show, :create, :index, :destroy] do
    resources :buzzs, only: :create
  end
  get 'clearbuzzs', to: 'buzzs#clearbuzzs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
