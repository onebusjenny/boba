Rails.application.routes.draw do
   resources :users, only: [:index,:show] do
    resources :teas, except: :delete
  end
  
# resources :teas, only: [:index, :show]

  root 'sessions#home'
  get '/' => 'sessions#home' 

  get '/signup', to: 'users#signup'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy' 

  get '/teas', to: 'teas#all_bobas'

  get '/auth/facebook'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/failure' => '/'

  post '/' => 'users#create'

  get '/' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  post '/users' => 'users#create'
  get '/bobas' => 'bobas#index'


end



