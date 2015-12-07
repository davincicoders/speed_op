SpeedOp::Application.routes.draw do
  root "sites#index"
  resources :sites
  get 'signup', to: 'users#index'

  # this provides the strategy for omniauth authentication
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get,
       :post]
  delete 'logout', to: 'sessions#destroy'

  match 'login', to: 'sessions#login',  via: [:get, :post]


  resources :users,
            only: [:new, :create],
            path_names: {new: "signup"}
  #

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]

end
