Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
  # if devise under resources :users
  # log out will find users#destroy instead of devise#destroy
  devise_for :users
  resources :users

  resources :courses

  namespace :admin do
    resources :users
    resources :courses
    resources :roles
  end

  get '/admin', to: 'admin#index'

end
