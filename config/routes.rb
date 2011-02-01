IIIaquarii::Application.routes.draw do
  devise_for :users

  resources :users

  root :to => "application#index"
end
