Rails.application.routes.draw do
  resources :field_agencies
  resources :type_users do
    member do
      delete :disable_type_users
      post :add_field_type_user
      delete :delete_field_type_user
    end
  end
  resources :field_type_users
  mount Ckeditor::Engine => '/ckeditor'
  resources :updates
  resources :type_materials do
    member do
      post :append_spec_type_material
    end
  end
  resources :spec_type_materials
  resources :sellers do
    member do
      post :add_type_material
      delete :delete_type_material
      post :add_field_seller
      put :update_field_seller
      delete :delete_field_seller
      delete :permanent_deletion
    end
  end
  resources :field_sellers
  resources :detentor_types
  resources :spec_materials
  resources :materials do
    collection do
      get :redefine_type_material
      get :redefine_seller_selected
      get :redefine_detentor_type
      get :redefine_material_selected
      get :get_all_specs_types
      get :get_all_field_sellers
    end
  end
  resources :procedures
  resources :agencies do
    collection do
      get :ping
    end
  end
  resources :categories do
    member do
      get :create_cats
      get :subcats
    end
  end
  resources :sous_categories
  get 'pages/home'
  get 'pages/help'
  get 'pages/404'
  get 'pages/under_construction'

  resources :rights do
    collection do
      post :check_uncheck_right
    end
  end
  resources :file
  resources :sessions, only: [:new, :create, :destroy]
  resources :incidents do
    member do
      get :update_subcats
      get :update_maxvalue_lvl_urgence
      get :send_tech_form
      get :order_by
    end
    collection do
      get :incidents_without_tech
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
      get :download
      get :change_ip
      put :enable_disable
    end
    collection do
      get :forget_identifiers
      post :forget_identifiers
    end
  end
  get '/', to: 'pages#home', as: :root
  get '/categories', to: 'categories#index'
  get '/sous_categories', to: 'sous_categories#index'
  get '/incidents', to: 'incidents#index'
  get '/signup', to: 'users#new', as: :signup
  get '/signin', to: 'sessions#new', as: :signin
  delete '/signout', to: 'sessions#destroy', as: :signout
  delete '/sessions', to: 'sessions#destroy', as: :sign_out
  get '/rights', to: 'rights#index'
  get '/agencies', to: 'agencies#index'
  get '/agencies_doPing', to: 'agencies#doPing'
  get '/sessions', to: redirect('/sessions/new')
  get '/api-docs', to: redirect('/swagger/dist/index.html?url=/api-docs/api-docs.json')

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
