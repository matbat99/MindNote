Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :songs, only: [:new, :create]

  resources :practices, only: [:index, :show, :destroy] do
    resources :sessions, only: [:new, :create]
    collection do
      get "review"
    end
    collection do
      get "progress"
    end
    member do
      get "statistics"
    end
    resources :sessions, only: [:create]
  end
end
