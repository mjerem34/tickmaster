#
# Copyright (c) 2015 by Montesinos Jeremy. All Rights Reserved.
#

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :updates
  resources :type_materials
  resources :specs_types_materials
  resources :sellers
  resources :fields_sellers
  resources :detentor_types
  resources :specs_materials
  resources :materials
  resources :procedures
  resources :agencies
  resources :categories do
    member do
      get :create_cats
    end
  end
  resources :sous_categories do
    member do
      get :create_subcats
    end
  end
  get 'pages/home'
  get 'pages/help'
  get 'pages/404'
  get 'pages/under_construction'

  resources :rights
  resources :file
  resources :sessions, only: [:new, :create, :destroy]
  resources :incidents do
    member do
      get :update_subcats
      get :update_maxvalue_lvl_urgence
      get :incidents_without_tech
      get :send_tech_form
      get :order_by
    end
    resources :responses
  end
  resources :procedures do
    get :update_subcats
  end
  resources :users do
    member do
      get :allincidents
      get :to_treat
      get :profil
      get :download
      get :mode_nuit_jour
      get :forget_identifiers
      post :forget_identifiers
      get :change_ip
    end
  end
  get '/', to: 'pages#home'
  get '/categories', to: 'categories#index'
  get '/sous_categories', to: 'sous_categories#index'
  get '/incidents', to: 'incidents#index'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  delete '/sessions', to: 'sessions#destroy'
  get '/rights', to: 'rights#index'
  get '/agencies', to: 'agencies#index'
  get '/agencies_doPing', to: 'agencies#doPing'
  get '/check_notify', to: 'users#check'
  get '/sessions', to: redirect('/sessions/new')

  # get '/nuit_jour', to: 'users#mode_nuit_jour'
  # get '/test_exception', to: 'application#test_exception'

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
