Rails.application.routes.draw do
  root to: "cocktails#home"
  resources :cocktails, only: [%i[show new create index]]
  resources :doses, only: [%i[new create destroy]]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
