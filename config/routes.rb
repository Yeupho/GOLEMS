Rails.application.routes.draw do
  get 'about/new'

  get 'about/create'

  get 'controllername/new'

  get 'controllername/create'

  root 'homes#index'

  get 'dashboards/index'

  get 'walk_ins/index'

  get 'pickups/index'

  get 'events/index'

  get 'customers/index'

  get 'dashboards/index'

  get 'employees/index'

  get 'pickups/index'

  get 'archive' => 'archive#index'

  get 'pickups/index'

  get 'admin' => 'admin#index'

  get 'about' => 'about#index'

  get 'admin/tabs/colors' => 'admin#colortab'

  get 'customers/all_transactions' => 'customers#all_transactions'

  get 'employees/all_assignments' => 'employees#all_assignments'

  match '/customer_events/create' => 'customer_events#create', via: [:get, :post], :as => :create_customer_event

  get '/customers/search' => 'customers#search', :as => :search_customer

  patch '/customer_event_products/update' => 'customer_event_products#update'

  post '/positions/create' => 'positions#create', :as => :create_position

  post '/employee_events/create' => 'employee_events#create', :as => :create_host

  post '/customer_event_products/create' => 'customer_event_products#create', :as => :create_product

  delete '/customers/delete_index' => 'customers#delete_index', :as => :delete_customer_index

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :archive
  resources :admin
  resources :customer_events do
    resources :customer_event_products, except: [:index, :show]
  end
  resources :customer_event_products
  resources :employee_events
  resources :events
  resources :products
  resources :customers
  resources :countries
  resources :employees
  resources :positions
  resources :colors
  resources :employee_statuses
  resources :employee_types
  resources :event_types
  resources :pickup_statuses
  resources :product_types
  resources :customer_statuses
  resources :states
  resources :web_form
  resources :dashboards
  resources :pickups
  resources :walk_ins
  resources :change_columns
  resources :about


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
