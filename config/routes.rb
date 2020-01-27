Rails.application.routes.draw do
    

  resource :users, only: [:index,:show] do
    resource :teas, only: [:show, :index]
  end

  resource :teas, only: [:index,:new, :create, :show, :edit, :update, :delete]
  
get '/' => 'sessions#home' 

get '/signup', to: 'users#signup'
post '/signup', to: 'users#create'

get '/login', to: 'sessions#login'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy' 

# get '/auth/facebook/callback' => 'sessions#create'
# get '/auth/failure' => '/'

root 'sessions#home'




post '/' => 'users#create'

get '/' => 'sessions#new'
post '/login' => 'sessions#create'
post '/logout' => 'sessions#destroy'

post '/users' => 'users#create'
get '/bobas' => 'bobas#index'

end







# get "bobas", to: "bobas#index"
# get "bobas", to: "bobas#new"
# post "bobas", to: "bobas#create"
# get "bobas", to: "bobas#show"
# get "bobas", to: "bobas#edit"
# patch "bobas", to: "bobas#update"
# delete "bobas", to: "bobas#destroy"



