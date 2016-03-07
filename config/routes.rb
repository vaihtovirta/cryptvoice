Rails.application.routes.draw do
  namespace :admin do
    resources :invoices

    root to: "invoices#index"
  end

  root to: "dashboard#index"

  resources :invoices, only: %i(new show create)
end
