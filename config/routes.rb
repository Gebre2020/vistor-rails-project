Rails.application.routes.draw do
  root "travels#index"

  # get "/travels", to: "travels#index"
  # get "/travels/:id", to: "travels#show"
  resources :travels


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
