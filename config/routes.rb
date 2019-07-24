Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :posts
  end
  # setup for devise we should update this when we have a user#index
  root "root#index"
  get 'show', to: 'posts#edit'
  get 'posts', to: 'posts#display_all'
end
