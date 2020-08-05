Rails.application.routes.draw do
  devise_for :items
  # devise_for :addresses
  # devise_for :sales
  # devise_for :items
  resources :items, only: :index
  #root to: 'tweets#index'
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :items
end
