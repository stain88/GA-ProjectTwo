Rails.application.routes.draw do
  root 'pages#home'
  get '/about' => 'pages#about'
  get '/rules' => 'pages#rules'
  resources :games do
    member do
      put "like", to: "games#vote", vote: :upvote
      put "dislike", to: "games#vote" , vote: :downvote
      put "unvote", to: "games#vote", vote: :unvote
    end
  end
  resources :jams
  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forum'

  mount Commontator::Engine => '/commontator'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {registrations: "registrations"}

  resources :users, only: [:show, :index]
  resources :friendships, only: [:create, :destroy, :accept] do
    member do
      put :accept
    end
  end
end
