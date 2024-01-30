Rails.application.routes.draw do
  root "students#index"
  resources :students do
    resources :comments
  end
end
  

