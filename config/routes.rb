Rails.application.routes.draw do
  resources :entries
  resources :comments
  get '/comments' => 'entries#new'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  post 'entry/new' => 'entries#new'
  get 'entry/new' => 'entries#new'
  get 'homepage' => 'visitors#index'
  post 'pages/entry/new' => 'entries#new'
  resources :users
  root 'visitors#index'
  post 'login' => 'sessions#create'
  post 'entries/entry/new' => 'entries#new'
  get 'comment' => 'comments#new'
  get 'entries/entry/new' => 'entries#new'
end
