Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
  # if devise under resources :users
  # log out will find users#destroy instead of devise#destroy
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    registrations: 'users/registrations',
    unlocks:       'users/unlocks',
    passwords:     'users/passwords',
    # omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: 'users/confirmations',
  }
  resources :users, except: %i[index create show]
  get 'profile', to: 'users#show'

  resources :courses

  namespace :admin do
    resources :users do
      resources :type_policies, only: %i[new create destroy]
    end
    resources :groups do
      resources :type_policies, only: %i[new create destroy]
      get 'members', to: 'groups#members'
      get 'member/new', to: 'groups#member_new'
      post 'member/create', to: 'groups#member_create'
    end
    resources :courses do
      resources :policies
    end
    resources :roles do
      resources :role_authorities
      post 'actions', to: 'role_authorities#actions'
    end
    resources :policies
  end

  get '/admin', to: 'admin#index'

end
