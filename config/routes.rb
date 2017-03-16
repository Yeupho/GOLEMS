Rails.application.routes.draw do
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
