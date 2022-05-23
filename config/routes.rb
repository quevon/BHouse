Rails.application.routes.draw do
  devise_for :owners
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :tenants

  patch 'admin/owners/:id/active', to: 'owners#active', as: 'active_owner'
  patch 'admin/owners/:id/inactive', to: 'owners#inactive', as: 'inactive_owner'

  namespace :api do
    namespace :v1 do
      resources :properties, only: [:index, :show, :create, :destroy]
    end
  end

  get '/properties/liked', to: 'properties#liked', as: 'liked_properties'
  get '/properties/applied', to: 'properties#applied', as: 'applied_properties'
  resources :properties do
    resources :property_tenants
  end
  # reset origin point foor searching properties
  get '/clear-origin_point', to: 'properties#clear_origin_point', via: [:destroy], as: 'clear_origin_point'
  # request and payment methods
  get '/payment', to: 'transactions#payment', as:'payment_transaction'
  patch '/paid', to: 'transactions#updatebalance', as: 'update_balance'
  # apply as tenant methods
  post '/properties/:property_id/property_tenants', to: 'property_tenants#create', as: 'create_property_tenant'
  patch '/properties/:property_id/property_tenants', to: 'property_tenants#update', as: 'update_property_tenant'
  # likes
  patch '/properties/:id/like', to: 'properties#add_like', as: 'add_like'
  delete '/properties/:id/like', to: 'properties#remove_like', as: 'remove_like'


  resources :conversations do
    resources :messages
  end
  get 'properties/:property_id/conversations/', to: 'conversations#new', as:'property_conversation'

  resources :transactions
  get '/:property_tenant_id/transactions/new', to: 'transactions#new', as:'request_payment'
  patch '/transactions/:id/payment', to: 'transactions#payment', as:'approve_payment'
  # add balance
  patch '/add_balance', to: 'tenants#add_balance', as:'add_balance'

  



  root to: "home#index"
end
  