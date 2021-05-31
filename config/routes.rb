Rails.application.routes.draw do

  namespace :admin do
    resources :users, only: [:show, :edit] do
      resources :events, only: [:index, :show] do
        patch :accept, to: 'events#accept'
        delete :refuse, to: 'events#refuse'
      end
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
  resources :users do
  end
  resources :users, only: [:show] do
    get 'events', to: 'events#index'
    resources :plans, only: [:show, :create, :edit, :update] do
      resources :events, only: [:index]
      patch 'events', to: 'events#reserve'
    end
  end

end
