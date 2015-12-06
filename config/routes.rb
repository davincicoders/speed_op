SpeedOp::Application.routes.draw do
  root "sites#index"
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get,
       :post]
  match '/logout', to: 'sessions#destroy', via: [:get, :post]
  resources :sites
  resources :users,
    only: [:new, :create],
     path_names: {new: "signup"}
 end
