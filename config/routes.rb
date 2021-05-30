Rails.application.routes.draw do

  namespace :admin do
    resources :users, only: [:show, :edit]
  end
  namespace :admin do
    resources :plans, only: [:show, :edit]
  end
  devise_for :users
  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
    get 'signin', to: 'devise/sessions#new'
    post 'signin', to: 'devise/sessions#create'
    get 'signup', to: 'devise/registration#new'
  end
  root to: 'users#index'
  resources 'users', only: [:index, :show, :new, :edit, :edit, :update, :destroy]
end
