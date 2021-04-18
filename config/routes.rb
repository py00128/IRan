Rails.application.routes.draw do
  resources :helps, only: [:new, :create]
  # Resource paths.
  resources :users, only: [:show, :new, :create, :update] do
    resources :runs, only: [:new, :create]
  end
  # Home page is the root.
  root 'home#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
