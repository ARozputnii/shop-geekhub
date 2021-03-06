Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root 'products#index'
    resources :user_sessions
    resources :users
    resources :orders
    resources :carts
    resources :line_items
    resources :products, only: %i[index show] do
      resources :comments
    end

    scope '/admin' do
      resources :categories, controller: 'backoffice/categories', as: 'admin_categories'
      resources :products,   controller: 'backoffice/products',   as: 'admin_products' do
        resources :images, only: %i[create destroy]
        resources :comments
      end
    end

    get 'login' => 'user_sessions#new', :as => :login
    post 'logout' => 'user_sessions#destroy', :as => :logout

    get 'pages/about'
    get 'pages/help'
  end
end
