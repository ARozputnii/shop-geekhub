Rails.application.routes.draw do
  root 'products#index'

  resources :products

  namespace :admin do
    resource :categories, controller: 'backoffice/categories'
    resource :products, controller: 'backoffece/products'
  end
end
