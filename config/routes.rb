IIIaquarii::Application.routes.draw do
  devise_for :users

  resources :users
  resources :ssh_keys
  resources :aq_repositories

  root :to => "application#index"
end
