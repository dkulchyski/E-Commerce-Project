Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :product
  resources :finder
  resources :category
  
  get 'search' => 'product#search', as: 'search_results'
  
  root to: 'finder#index'
end
