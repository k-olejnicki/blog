Rails.application.routes.draw do
  resources :entries
  resources :comments
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'

  resources :users
  root to: 'visitors#index'
  post 'login' => 'sessions#create'
end
