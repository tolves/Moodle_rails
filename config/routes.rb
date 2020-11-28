Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
  # if devise under resources :users
  # log out will find users#destroy instead of devise#destroy
  devise_for :users
  resources :users, except: %i[index create show]
  get 'profile', to: 'users#show'

  resources :courses

  namespace :admin do
    resources :users do
      resources :type_policies, only: %i[new create destroy]
    end
    resources :groups do
      resources :type_policies, only: %i[new create destroy]
    end
    resources :courses do
      resources :policies
    end
    resources :roles do
      resources :role_authorities
    end
    resources :policies
  end

  get '/admin', to: 'admin#index'

end
