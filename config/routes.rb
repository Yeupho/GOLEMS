Rails.application.routes.draw do
  resources :change_columns
  get 'pickups/index'

  root 'dashboards#index'

  get 'events/index'

  get 'customers/index'

  get 'dashboards/index'

  get 'employees/index'

  get 'layouts/new_release' => 'layout#new_release', :as => :new_release
  get 'pickups/index'

  resources :customer_event_products
  resources :customer_events
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
