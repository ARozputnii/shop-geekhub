Rails.application.routes.draw do
  root 'products#index'

  resources :products


  scope '/admin' do
    resources :categories, controller: 'backoffice/categories'
    resources :products, controller: 'backoffice/products'
  end
end
