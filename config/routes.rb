Rails.application.routes.draw do
  # Route for profile page
  get 'profile/index', to: 'profile#index', as: 'profile'

  # Route for search bar
  get '/search', to: 'listing#search'

  # Route to order
  get '/buy/:listing_id', to: 'orders#buy', as: 'buy'
  get '/success', to: 'orders#success', as: 'success'
  get '/cancel', to: 'orders#cancel', as: 'cancel'

  # All routes for requests
  resources :requests

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
