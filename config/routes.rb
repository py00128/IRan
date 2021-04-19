Rails.application.routes.draw do
  # Resource paths.
  resources :helps, only: [:new, :create]
  resources :runs, only: [:new, :create]
  resources :users, only: [:show, :new, :create]
  # Home page is the root.
  root 'home#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
