Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :songs, only: [:new, :create]
  get 'songs/learn', to: "songs#learn", as: :learn

  resources :practices, only: [:index, :show, :destroy] do
    resources :sessions, only: [:new, :create]
    resources :notes, only: [:create, :index]
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
