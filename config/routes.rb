#
# Copyright (c) 2015 by Montesinos Jeremy. All Rights Reserved.
#

Rails.application.routes.draw do
  resources :agencies
  resources :teches
  resources :categories
  resources :sous_categories
  resources :files_archives
  resources :files_incidents
  resources :files_responses
  resources :files_users
  get 'pages/home'
  get 'pages/help'

  resources :rights
  resources :file
  resources :sessions, only: [:new, :create, :destroy]
  resources :incidents do
    member do
      put :cloture_it
      put :reopen_it
      put :read_it
      put :reject_it
      get :cloture_it
      get :reopen_it
      get :read_it
      get :reject_it
      get :update_subcats
      get :update_maxvalue_lvl_urgence
      get :incidents_without_tech
      get :download
    end
    resources :responses do
      member do
        get :download
      end
    end
  end
  resources :teches
  resources :users do
    member do
      get :allincidents
      get :to_treat
      get :profil
      get :download
    end
  end
  get '/', to: 'pages#home'
  get '/users', to: 'users#index'
  get '/categories', to: 'categories#index'
  get '/sous_categories', to: 'sous_categories#index'
  get '/incidents', to: 'incidents#index'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  get '/rights', to: 'rights#index'
  get '/agencies', to: 'agencies#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root '#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
