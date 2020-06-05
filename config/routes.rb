Rails.application.routes.draw do
  root to: 'site#home'

  get 'signup', to: 'users#new'
  post '/users', to: 'users#create'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  get '/home', to: 'site#home'
  resources :products do
    resources :reviews, except: [:destroy]
  end
end
