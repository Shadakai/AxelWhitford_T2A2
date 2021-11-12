Rails.application.routes.draw do
  get 'profile/index', to: 'profile#index', as: 'profile'
  get 'requests/index', to: 'requests#index', as: 'requests'
  get 'requests/new', to: 'requests#new', as: 'new_request'
  resources :listings
  devise_for :users, controllers: { registrations: 'registrations' }
  root to:'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
