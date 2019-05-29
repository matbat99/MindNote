Rails.application.routes.draw do
  get 'songs/create'
  devise_for :users
  root to: 'pages#home'
  resources :songs, only: [:create]

  resources :practices, only: [:index, :show, :destroy] do
    collection do
      get "review"
    end
    resources :sessions, only: [:create]
  end
end
