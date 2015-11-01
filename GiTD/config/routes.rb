Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {registrations: "registrations"}
  root 'pages#home'

  resources :users, only: [:show, :index]
  resources :friendships, only: [:create, :destroy, :accept] do
    member do
      put :accept
    end
  end

end
