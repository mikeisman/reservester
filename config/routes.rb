Rails.application.routes.draw do
  devise_for :owners

  get '/restaurants/dashboard', to: 'restaurants#dashboard', as: 'dashboard'
  
  resources :restaurants do
    resources :reservations
  end

  root 'restaurants#index'
end
