Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  resources :users
  devise_for :users

  resources :courses

  namespace :admin do
    resources :users do
      resources :roles
    end
    resources :courses
    # resources :categories
  end

end
