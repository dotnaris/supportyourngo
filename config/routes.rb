Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :projects do
    resources :pledges, only: [:new, :create]
    resources :contributions, only: [:new, :show, :create, :edit, :update, :destroy]
  end

  resources :pledges, only: [:edit, :update]

  # dashboard -> user show page
  resources :users, only: [:show, :update]

  resources :contributions, only: [:index]
end
