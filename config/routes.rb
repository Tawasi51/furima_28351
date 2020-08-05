Rails.application.routes.draw do
  devise_for :addresses
  devise_for :delivers
  devise_for :items
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
