Rails.application.routes.draw do
  # Resource paths.
  resources :users, except: :index do
    resources :runs
  end
  # Home page is the root.
  root 'home#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
