Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :posts
  end
  #setup for devise we should update this when we have a user#index
  root "root#index"
end
