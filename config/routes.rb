Rails.application.routes.draw do
  root 'sessions#home'
  
  # signup route
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

   # login route
   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   #get '/welcome' => 'sessions#welcome'
 
   # logout route
   delete '/logout' => 'sessions#destroy'
   get '/auth/:provider/callback', to: 'sessions#omniauth'
  
   resources :users, only: [:new, :create]
   
  # nested routes should go in one direction
  # parent to child
  # resources :locations do  # 7 restful routes
  #   resources :travels, only: [:index, :new, :create] #7 restful routes for nested resources
  # end
  # resources :travels
  resources :travels, only: [:index, :new, :create] # anything non-nested
  
  resources :locations do  # 7 restful routes
    resources :travels  #, shallow: true #7 restful routes for nested resources
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
