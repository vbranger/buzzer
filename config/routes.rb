Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :games, only: [:show, :create, :index] do
    resources :buzzs, only: :create
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
