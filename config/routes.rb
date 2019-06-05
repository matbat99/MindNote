Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/landing', to: 'pages#landing'
  resources :songs, only: [:new, :create]
  get 'songs/learn', to: "songs#learn", as: :learn
  post '/practices/:id/create_from_note_menu', to: "notes#create_from_note_menu", as: :create_note

  # resources :learn_songs, only: :update

  resources :practices, only: [:index, :show, :destroy] do
    resources :sessions, only: [:new, :create]
    resources :notes, only: [:create, :new, :update, :index, :show, :destroy]
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
  resources :imports, only: :index
end
