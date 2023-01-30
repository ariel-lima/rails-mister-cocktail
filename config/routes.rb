Rails.application.routes.draw do
  root to: "cocktails#home"
  resources :cocktails do
    resources :doses, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :doses, only: [:destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
