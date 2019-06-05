Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :songs, only: [:new, :create]
  get 'songs/learn', to: "songs#learn", as: :learn

  # resources :learn_songs, only: :update

  resources :practices, only: [:index, :show, :destroy] do
    resources :sessions, only: [:new, :create]
    resources :notes, only: [:create, :update, :index, :show, :destroy]
    collection do
      get "review"
      get "progress"
    end
    member do
      get "statistics"
    end
    resources :sessions, only: [:create]
  end

  resources :playlists, only: [:index, :show, :create]
end
