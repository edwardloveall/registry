Rails.application.routes.draw do
  root to: 'home#show'

  resource :session, only: [:create, :destroy]
  resources :users, only: [:new, :create]
  namespace :registry do
    root to: 'products#index'
    resources :products, except: :show
  end

  get 'sign_in', to: 'sessions#new', as: 'sign_in'
end
