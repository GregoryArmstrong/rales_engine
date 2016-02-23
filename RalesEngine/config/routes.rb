Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/merchants/find', to: 'merchantsfind#show'
      get '/transactions/find', to: 'transactionsfind#show'
      get '/customers/find', to: 'customersfind#show'
      get '/merchants/find_all', to: 'merchantsfind#index'
      get '/transactions/find_all', to: 'transactionsfind#index'
      get '/customers/find_all', to: 'customersfind#index'
      get '/merchants/random', to: 'merchantsrandom#show'
      get '/transactions/random', to: 'transactionsrandom#show'
      get '/customers/random', to: 'customersrandom#show'
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
    end
  end
end
