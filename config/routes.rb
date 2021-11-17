Rails.application.routes.draw do
  # Route for profile page
  get 'profile/index', to: 'profile#index', as: 'profile'

  # Route for search bar
  get '/search', to: 'listings#search'

  # Routes for single order
  get '/buy', to: 'orders#buy', as: 'buy'
  get '/buy_now/:listing_id', to: 'orders#buy_now', as: 'buy_now'
  get '/success', to: 'orders#success', as: 'success'
  get '/cancel', to: 'orders#cancel', as: 'cancel'

  # Routes for cart
  get 'add_to_cart/:listing_id', to: 'orders#add_to_cart', as: 'add_to_cart'
  get '/cart', to: 'orders#index', as: 'cart'

  # Nest a comments route within the listings route example ~ Listing/1/comments
  resources :listings do 
    resources :comments
  end

  # Devise
  devise_for :users, controllers: { registrations: 'registrations' }
  # Root Route
  root to:'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
