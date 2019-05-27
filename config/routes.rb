Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :practices, only: [:index, :show, :create, :destroy] do
    resources :sessions, only: [:create]
    member do
      get 'learn'
    end
  end
end
