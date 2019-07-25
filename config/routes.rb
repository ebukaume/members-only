Rails.application.routes.draw do
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  get '/sign_up', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :index]  
  resources :users, only: [:new, :create]  
end
