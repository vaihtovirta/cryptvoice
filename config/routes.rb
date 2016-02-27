Rails.application.routes.draw do
  resources :invoices
  root to: "dashboard#index"

  resources :invoices
end
