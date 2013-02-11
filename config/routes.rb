Totemtext::Application.routes.draw do

  root to: 'home#index'

  resources :documents
  resources :thoughts
  resources :attachments
  resources :links

  resources :users, only: [ :index, :show, :edit, :update ]

  match '/auth/:provider/callback', to: 'sessions#create'
  match '/signin', to: 'sessions#new', as: :signin
  match '/signout', to: 'sessions#destroy', as: :signout
  match '/auth/failure', to: 'sessions#failure'
end
