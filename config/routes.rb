# routes.rb
Rails.application.routes.draw do
  resources :field_agencies
  resources :type_users do
    member do
      patch :toggle
      post :bind_field_type_user
      delete :unbind_field_type_user
    end
  end
  resources :field_type_users
  resources :updates
  resources :type_materials do
    member do
      post :append_spec_type_material
      delete :unbind_spec_type_material
    end
  end
  resources :user_sessions do
    collection do
      post :retrieve_credentials
    end
  end
  resources :spec_type_materials
  resources :sellers do
    member do
      post :bind_type_material
      delete :unbind_type_material
      post :bind_field_seller
      put :update_field_seller
      delete :unbind_field_seller
      delete :permanent_deletion
    end
  end
  resources :field_sellers
  resources :detentor_types, only: %i[index]
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
  resources :sessions, only: %i[new create destroy]
  resources :incidents do
    member do
      get :update_subcats
      get :update_maxvalue_lvl_urgence
      get :send_tech_form
      get :order_by
      delete :cloture
      delete :reject
      put :reaffect
    end
  end
  resources :responses, only: :create
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
  get '/', to: 'user_sessions#new', as: :root
  get '/categories', to: 'categories#index'
  get '/sous_categories', to: 'sous_categories#index'
  get '/incidents', to: 'incidents#index'
  get '/signup', to: 'users#new', as: :signup
  get '/signin', to: 'user_sessions#new', as: :signin
  delete '/signout', to: 'user_sessions#destroy', as: :signout
  get '/rights', to: 'rights#index'
  get '/agencies', to: 'agencies#index'
  post '/attachments/upload', to: 'attachments#upload'
  put '/attachments/destroy', to: 'attachments#destroy'
end
