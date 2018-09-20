Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'signup', to: 'users#new'
  get 'products_by_category', to: 'categories#products_by_category'
  resources :users,except: [:new]
  resources :products
  resources :product_images
  resources :reviews
  resources :addresses
  get 'checkout_shipping_type',to: 'checkout#checkout_shipping_type'
  get 'checkout_shipping_address',to: 'checkout#checkout_shipping_address'
  get 'show_cart', to: 'carts#show_cart'
  delete 'remove_cart_product', to: 'carts#remove_cart_product'
  post 'add_product_to_cart', to: 'carts#add_product_to_cart'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy'
end
