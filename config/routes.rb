Rails.application.routes.draw do
  root to: "dashboard#index"

  resources :invoices, only: %i(new show create)
end
