Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :projects do
    resources :contributions, only: [:new, :show, :create, :edit, :update, :destroy]
  end

  resources :contributions, only: [:index]
end
