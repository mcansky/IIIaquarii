IIIaquarii::Application.routes.draw do
  devise_for :users

  resources :users
  resources :ssh_keys
  resources :aq_repositories

  # fork
  match "/aq_repositories/fork/:id" => "aq_repositories#fork"

  # browse
  match "/aq_repositories/browse/:id/(:dir)", :to => "aq_repositories#show", :dir => /(.*)/

  # view a file
  match "/aq_repositories/view_file/:id/(:file_path)", :to => "aq_repositories#view_file", :file_path => /(.*)/

  # commit log
  match "/aq_repositories/commits/:id", :to => "aq_repositories#show_commits"
  match "/aq_repositories/commits/:id/:commit_id", :to => "aq_repositories#show_commit"

  root :to => "application#index"
end
