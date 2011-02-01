IIIaquarii::Application.routes.draw do
  devise_for :users

  resources :users
  resources :ssh_keys

  root :to => "application#index"
end
