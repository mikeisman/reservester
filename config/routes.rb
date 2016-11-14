Rails.application.routes.draw do
  devise_for :users

  get '/restaurants/dashboard', to: 'restaurants#owner_dashboard', as: 'owner_dashboard'
  get '/my-stars', to: 'restaurants#patron_dashboard', as: 'patron_dashboard'

  resources :restaurants do
    resources :reservations
    put :star, on: :member
  end

  root 'restaurants#index'
end
