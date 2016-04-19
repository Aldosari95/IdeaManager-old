Rails.application.routes.draw do
  resources :roles
  resources :ideas
  root to: 'visitors#index'

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users do
  get :make_admin, on: :member
  end

end
