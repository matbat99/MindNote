Rails.application.routes.draw do
  get 'songs/create'

  # get '/paractices/progress', to: 'practices#progress', as: 'progress' ---> do collection <----- not id
  # get '/practices/statistics/:id', to: 'practices#statistics', as: 'statistics' ---> do member <----- id

  devise_for :users
  root to: 'pages#home'
  resources :songs, only: [:create]

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
