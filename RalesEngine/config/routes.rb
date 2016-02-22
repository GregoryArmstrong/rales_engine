Rails.application.routes.draw do



  namespace :api do
    namespace :v1 do
      get '/merchants/find', to: 'merchantsfind#show', defaults: {format: :json}
      resources :merchants, only: [:index, :show], defaults: { format: :json }
    end
  end
end
