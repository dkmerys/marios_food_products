Rails.application.routes.draw do
  root to: 'site#home'

  get '/home', to: 'site#home'
  resources :products do
    resources :reviews, except: [:destroy]
  end
end
