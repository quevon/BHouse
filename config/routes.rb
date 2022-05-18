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
  post '/properties/:property_id/property_tenants', to: 'property_tenants#create', as: 'create_property_tenant'
  patch '/properties/:property_id/property_tenants', to: 'property_tenants#update', as: 'update_property_tenant'

  resources :conversations do
    resources :messages
  end


  root to: "home#index"
end
  