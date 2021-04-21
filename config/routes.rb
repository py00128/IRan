Rails.application.routes.draw do
  devise_for :users
  # Resource paths.
  resources :helps, only: [:new, :create]
  resources :runs, only: [:show, :new, :create]
  resources :users, only: [:show, :new, :create]
  # Home page is the root.
  root 'home#home'
  # Some shit I wrote ages ago that works - Arthur
  get 'home', to: 'home#home'
  get 'helps', to: 'helps#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
