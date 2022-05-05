Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: :callbacks}
  
  get "/profile", to: "users#show", as: "user"
  root "tweets#index"

  resources :likes
  resources :tweets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
