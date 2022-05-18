Rails.application.routes.draw do
  resources :transactions
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

  resources :properties do
    resources :property_tenants
  end
  # reset origin point foor searching properties
  get '/clear-origin_point', to: 'properties#clear_origin_point', via: [:destroy], as: 'clear_origin_point'
  # apply as tenant methods
  post '/properties/:property_id/property_tenants', to: 'property_tenants#create', as: 'create_property_tenant'
  patch '/properties/:property_id/property_tenants', to: 'property_tenants#update', as: 'update_property_tenant'
  # likes
  patch '/properties/:id/like', to: 'properties#like', as: 'add_like'


  resources :conversations do
    resources :messages
  end
  get 'properties/:property_id/conversations/', to: 'conversations#new', as:'property_conversation'


  root to: "home#index"
end
  