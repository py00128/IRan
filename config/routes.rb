Rails.application.routes.draw do
  # Resource paths.
  resources :helps, only: [:new, :create]
  resources :runs, only: [:new, :create]
  resources :users, only: [:show, :new, :create]
  # Home page is the root.
  root 'home#home'
  # Some shit I wrote ages ago that works - Arthur
  get 'home', to: 'home#home'
  get 'users', to: 'users#show'
  get 'runs', to: 'runs#new'
  get 'helps', to: 'helps#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
