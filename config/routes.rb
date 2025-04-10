Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "shelters#index"

  #shelters routes
  #get "/shelters", to: "shelters#index"
  #get "/shelters/:id", to: "shelters#show"
  #get "/shelters/new", to: "shelters#new"
  resources :shelters
  #pets routes
  get "/pets", to: "pets#index"
  get "/pets/:id", to: "pets#show"

  #shelter-pets routes
  get "/shelters/:id/pets", to: "shelter_pets#index"
  get "/shelters/:id/pets/new", to: "shelter_pets#new"
  post "shelter/pets", to: "shelter_pets#create"
end
