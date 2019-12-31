Rails.application.routes.draw do
  root 'products#index'

  resources :products
  resources :categories

  scope '/admin' do
    resources :categories, controller: 'backoffice/categories', as: 'admin_categories'
    resources :products,   controller: 'backoffice/products',   as: 'admin_products' do
      resources :images, only: [:create, :destroy]
    end
  end

  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
