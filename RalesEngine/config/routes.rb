Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/merchants/find', to: 'find_merchants#show'
      get '/transactions/find', to: 'find_transactions#show'
      get '/customers/find', to: 'find_customers#show'
      get '/items/find', to: 'find_items#show'
      get '/invoices/find', to: 'find_invoices#show'

      get '/merchants/find_all', to: 'find_merchants#index'
      get '/transactions/find_all', to: 'find_transactions#index'
      get '/customers/find_all', to: 'find_customer#index'
      get '/items/find_all', to: 'find_items#index'
      get '/invoices/find_all', to: 'find_invoices#index'

      get '/merchants/random', to: 'random_merchants#show'
      get '/transactions/random', to: 'random_transactions#show'
      get '/customers/random', to: 'random_customers#show'
      get '/items/random', to: 'random_items#show'
      get '/invoices/random', to: 'random_invoices#show'

      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
    end
  end
end
