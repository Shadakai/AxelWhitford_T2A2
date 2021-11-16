Rails.application.routes.draw do
  get 'profile/index', to: 'profile#index', as: 'profile'
  resources :requests

  #Nest a comments route within the listings route example ~ Listing/1/comments
  resources :listings do 
    resources :comments
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  root to:'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
