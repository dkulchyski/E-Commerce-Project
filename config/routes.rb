Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :product
  resources :finder
  resources :category
  
  root to: 'finder#index'
end
