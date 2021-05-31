Rails.application.routes.draw do

  namespace :admin do
    resources :users, only: [:show, :edit] do
      resources :plans
      resources :plans, only: [:show] do
        resources :events, only: [:index, :new, :create, :edit, :update, :destroy]
      end      
    end
  end
  devise_for :users
  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
    get 'signin', to: 'devise/sessions#new'
    post 'signin', to: 'devise/sessions#create'
    get 'signup', to: 'devise/registration#new'
  end
  root to: 'users#index'
  resources 'users' do
  end
  resources 'user', only: [:show] do
    resources 'plans', only: [:show, :create, :edit, :update]
  end
end
