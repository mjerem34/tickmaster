# routes.rb
Rails.application.routes.draw do
  resources :field_agencies
  resources :type_users do
    member do
      patch :toggle
    end
  end
  resources :field_type_users do
    member do
      delete :unbind
    end
  end
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
  resources :detentor_types, only: %i(index)
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
      get :do_ping
    end
  end
  resources :categories do
    member do
      get :create_cats
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
  resources :sessions, only: %i(new create destroy)
  resources :incidents do
    member do
      get :update_subcats
      get :update_maxvalue_lvl_urgence
      get :send_tech_form
      get :order_by
    end
    collection do
      get :without_tech
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
  get '/sessions', to: redirect('/sessions/new')
end
