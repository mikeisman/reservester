Rails.application.routes.draw do
  devise_for :users

  get '/restaurants/dashboard', to: 'restaurants#dashboard', as: 'dashboard'

  resources :restaurants do
    resources :reservations
    put :star, on: :member
  end

  root 'restaurants#index'
end
