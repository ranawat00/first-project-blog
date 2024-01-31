Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  ActiveAdmin.routes(self)
  root "students#index"
  resources :students do
    resources :comments
  end
end