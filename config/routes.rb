Rails.application.routes.draw do
  post 'messages', to: "messages#create"
  devise_for :users
  # Resource paths.
  resources :helps, only: [:new, :create]
  resources :runs, only: [:show, :new, :create]
  resources :users, only: [:show]
  # Home page is the root.
  root 'home#home'
  # Some shit I wrote ages ago that works - Arthur
  get 'home', to: 'home#home'
  get 'helps', to: 'helps#new'
  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
