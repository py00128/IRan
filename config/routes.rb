Rails.application.routes.draw do
  resources :runs
  resources :users
  # Home page is the root.
  root 'home#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
