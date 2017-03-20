Rails.application.routes.draw do
  root 'dashboards#index'


  resources :customer_events do
    resources :customer_event_products, except: [:index]
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

  get 'events/index'

  get 'customers/index'

  get 'dashboards/index'

  get 'employees/index'

  get 'pickups/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
