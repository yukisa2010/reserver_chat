Rails.application.routes.draw do
  get '/', to: 'users#index'
  resources 'users', only: [:index, :show, :new, :edit, :edit, :update, :destroy]
end
