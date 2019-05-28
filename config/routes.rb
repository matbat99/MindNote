Rails.application.routes.draw do
  get 'songs/create'
  devise_for :users
  root to: 'pages#home'
  resources :songs, only: [:create]

  resources :practices, only: [:index, :show, :create, :destroy] do
    resources :sessions, only: [:create]
    member do
      get 'learn'
    end
  end
end
