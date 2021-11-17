Rails.application.routes.draw do
  # Route for profile page
  get 'profile/index', to: 'profile#index', as: 'profile'

  # Route for search bar
  get '/search', to: 'listing#search'

  # Route to buy 
  get '/buy', to: 'orders#buy'

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
