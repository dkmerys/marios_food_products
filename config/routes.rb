Rails.application.routes.draw do
  resources :products do
    resources :reviews, except: [:destroy, :update]
  end
end
