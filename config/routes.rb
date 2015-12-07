SpeedOp::Application.routes.draw do
  root "sites#index"
  resources :sites
  get 'signup', to: 'users#index'

  # this provides the strategy for omniauth authentication
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get,
       :post]
  delete 'logout', to: 'sessions#destroy'

  match 'login', to: 'sessions#login',  via: [:get, :post]

 end
