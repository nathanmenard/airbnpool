Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :profile, only: [:show, :edit, :update]

  namespace :owner do
    resources :pools, only: [:index]
  end

  resources :pools do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index] do
    member do
      patch 'accept'
      patch 'decline'
    end
  end
end
