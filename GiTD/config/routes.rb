Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {registrations: "registrations"}
  root 'pages#home'

  resources :users, only: [:show, :index]

  match 'auth/:provider/callback' => 'authentications#create', via: [:get, :post]

end
