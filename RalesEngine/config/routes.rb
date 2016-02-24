Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/merchants/find', to: 'find_merchants#show'
      get '/transactions/find', to: 'find_transactions#show'
      get '/customers/find', to: 'find_customers#show'
      get '/items/find', to: 'find_items#show'
      get '/invoices/find', to: 'find_invoices#show'
      get '/invoice_items/find', to: 'find_invoice_items#show'

      get '/merchants/find_all', to: 'find_merchants#index'
      get '/transactions/find_all', to: 'find_transactions#index'
      get '/customers/find_all', to: 'find_customers#index'
      get '/items/find_all', to: 'find_items#index'
      get '/invoices/find_all', to: 'find_invoices#index'
      get '/invoice_items/find_all', to: 'find_invoice_items#index'


      get '/merchants/random', to: 'random_merchants#show'
      get '/transactions/random', to: 'random_transactions#show'
      get '/customers/random', to: 'random_customers#show'
      get '/items/random', to: 'random_items#show'
      get '/invoices/random', to: 'random_invoices#show'
      get '/invoice_items/random', to: 'random_invoice_items#show'


      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index], :controller => 'merchants/items'
        resources :invoices, only: [:index], :controller => 'merchants/invoices'
        resources :revenue, only: [:index], :controller => 'merchants/revenue'
        resources :favorite_customer, only: [:index], :controller => 'merchants/favorite_customer'
        resources :customers_with_pending_invoices, only: [:index], :controller => 'merchants/customers_with_pending_invoices'
      end
      resources :transactions, only: [:index, :show] do
        resources :invoices, only: [:index], :controller => 'transactions/invoices'
      end
      resources :customers, only: [:index, :show] do
        resources :invoices, only: [:index], :controller => 'customers/invoices'
        resources :transactions, only: [:index], :controller => 'customers/transactions'
      end
      resources :items, only: [:index, :show] do
        resources :invoice_items, only: [:index], :controller => 'items/invoice_items'
        resources :merchants, only: [:index], :controller => 'items/merchants'
      end
      resources :invoices, only: [:index, :show] do
        resources :transactions, only: [:index], :controller => 'invoices/transactions'
        resources :invoice_items, only: [:index], :controller => 'invoices/invoice_items'
        resources :items, only: [:index], :controller => 'invoices/items'
        resources :customers, only: [:index], :controller => 'invoices/customers'
        resources :merchants, only: [:index], :controller => 'invoices/merchants'
      end
      resources :invoice_items, only: [:index, :show] do
        resources :invoices, only: [:index], :controller => 'invoice_items/invoices'
        resources :items, only: [:index], :controller => 'invoice_items/items'
      end
    end
  end
end
