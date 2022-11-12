Rails.application.routes.draw do
  get 'reviews/new'
  resources :restaurants
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :reviews, only: [:new]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
