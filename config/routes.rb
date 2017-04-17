Rails.application.routes.draw do
  # Root
  root 'homes#index'

  # Dashboard
  get 'dashboards/index'

  # Event
  get 'events/index'

  # Customer_event
  match '/customer_events/create' => 'customer_events#create', via: [:get, :post], :as => :create_customer_event
  delete '/customer_events/walk_in_destroy' => 'customer_events#walk_in_destroy', :as => :walk_in_destroy

  # Customer_event_product
  post '/customer_event_products/create' => 'customer_event_products#create', :as => :create_product
  patch '/customer_event_products/update' => 'customer_event_products#update'

  # Walk-In
  get 'walk_ins/index'

  # Customer
  get 'customers/index'
  get 'customers/all_transactions' => 'customers#all_transactions'
  get '/customers/search' => 'customers#search', :as => :search_customer

  # Employee
  get 'employees/index'
  get 'employees/all_assignments' => 'employees#all_assignments'
  post '/employee_events/create' => 'employee_events#create', :as => :create_host
  post '/positions/create' => 'positions#create', :as => :create_position

  # Pick-Up
  get 'pickups/index'
  patch '/customer_event_products/ready_tab_update' => 'customer_event_products#ready_tab_update'
  patch '/customer_event_products/progress_tab_update' => 'customer_event_products#progress_tab_update'
  patch '/customer_event_products/picked_tab_update' => 'customer_event_products#picked_tab_update'

  # Admin
  get 'admin' => 'admin#index'

  get 'about' => 'about#index'
  get 'admin/tabs/colors' => 'admin#colortab'

  # Archive
  get 'archive' => 'archive#index'

  get 'about/new'
  get 'about/create'
  get 'controllername/new'
  get 'controllername/create'
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
