SpeedOp::Application.routes.draw do
  root "sites#index"
  resources :sites do
    member do
      post 'update_score', as: 'update_score_for'
    end
  end
  get 'signup', to: 'users#index'

  # this provides the strategy for omniauth authentication
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get,
       :post]
  delete 'logout', to: 'sessions#destroy'
  match 'login', to: 'users#login',  via: [:get, :post]


  resources :users,
            only: [:new, :create],
            path_names: {new: "signup"}


  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]

  # heroku logs

  get 'static_pages/heroku_errors'
  get 'static_pages/maintenance_heroku'


end
