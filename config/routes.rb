Rails.application.routes.draw do
  root 'sessions#home'
  #root "travels#index"
  
  # signup route
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

   # login route
   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   get '/welcome' => 'sessions#welcome'
 
   # logout route
   delete '/logout' => 'sessions#destroy'

  resources :users do
    resources :travels, only: [:new,:create,:index ]
  end

  resources :travels do
    resources :locations, only: [:new,:create,:index ]
  end
  resources :locations
h

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
