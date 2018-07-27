Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'sessions/create'
  get 'sessions/destroy'
  get 'home/index'
  get '/login', to: 'home#login'
  get 'profile', to: 'user#index'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:index]
  resources :user
  resource :projects, only: [:show, :new, :create]
  resources :star, only: [:new, :create]

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
