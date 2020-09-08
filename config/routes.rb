Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/rout#ng.html
  root "dashboard#dashboard"
  resources :user_managements
  resources :users
end
