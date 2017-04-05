Rails.application.routes.draw do
  root 'dashboards#index'

  get 'walk_ins/index'

  get 'pickups/index'

  get 'events/index'

  get 'customers/index'

  get 'dashboards/index'

  get 'employees/index'

  get 'layouts/new_release' => 'layout#new_release', :as => :new_release
  get 'pickups/index'

  get 'archive' => 'archive#index'

  get 'pickups/index'

  get 'admin' => 'admin#index'

  match '/colors/create' => 'colors#create', via: [:get, :post], :as => :create_color

  match '/customer_events/create' => 'customer_events#create', via: [:get, :post], :as => :create_customer_event
  match '/customers/create' => 'customers#create', via: [:get, :post], :as => :create_customer
  get '/customers/search' => 'customers#search', :as => :search_customer
  match '/events/create' => 'events#create', via: [:get, :post], :as => :get_color
  put '/customer_event_products/update' => 'customer_event_products#update', :as => :update_pickup_status

  resources :archive
  resources :admin
  resources :customer_events do
    resources :customer_event_products, except: [:index, :show]
  end
  resources :employee_events
  resources :events
  resources :products
  resources :customers
  resources :countries
  resources :employees
  resources :positions
  resources :colors
  resources :event_statuses
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
