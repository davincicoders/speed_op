SpeedOp::Application.routes.draw do
   match 'auth/:provider/callback', to: 'sessions#oauth', via: [:get,
       :post]
    match '/logout', to: 'sessions#destroy', via: [:get, :post]


  resources :sites
#
   root "sites#index"
#
#  # get '/auth/:provider/callback', to: 'sites#index'
   get 'login', to: 'sessions#login'
#   post 'login', to: 'sessions#create'
#   # delete '/logout', to: 'sessions#destroy'
#
#
#   # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
#   match '/logout', to: 'sessions#destroy', via: [:get, :post]
#
#
  resources :users,
    only: [:new, :create],
     path_names: {new: "signup"}
#
#   # root to: 'sessions#new'
#   resources :sessions, only: :index
#  # get "/auth/:provider/callback" => 'sessions#create'
 end
