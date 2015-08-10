Rails.application.routes.draw do
  root to: 'pages#root'

  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create' # Needed for developer strategy

  delete '/sessions', to: 'sessions#destroy', as: :logout

  resources :messages, only: %i(index)
end
