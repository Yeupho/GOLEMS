Rails.application.routes.draw do
  resources :colors
  resources :events
  resources :event_statuses
  resources :employees
  resources :employee_statuses
  resources :products
  resources :employee_types
  resources :event_types
  resources :employee_events
  resources :customer_events
  resources :pickup_statuses
  resources :product_types
  resources :customer_event_products
  resources :customer_statuses
  resources :states
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
