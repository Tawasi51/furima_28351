Rails.application.routes.draw do
  #devise_for :users
  root 'items#index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
    }
    
    
    devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    end
    
    
    # devise_for :items
  # devise_for :addresses
  # devise_for :sales
  # devise_for :items
  resources :items do
    resources :sales, only: [:create,:index]
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :items
end
