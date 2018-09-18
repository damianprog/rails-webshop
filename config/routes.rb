Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'signup', to: 'users#new'
  get 'products_by_category', to: 'categories#products_by_category'
  resources :users,except: [:new]
  resources :products
  resources :product_images
  resources :reviews
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy'
end
