IIIaquarii::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :ssh_keys
  resources :users
  #resources :aq_repositories # nested on :users
  resources :users do
    resources :aq_repositories do
      member do
        get "fork", :action => "fork"
        match "dirs/:branch/(:dir)", :action => "show", :dir => /(.*)/, :via => :get, :as => :show_dir
        match "files/:branch/:file_path", :action => "view_file", :file_path => /(.*)/, :via => :get, :as => :show_file
        match "raw/:branch/:file_path", :action => "view_raw_file", :file_path => /(.*)/, :via => :get, :as => :raw_file
        get "commits/:branch", :action => "show_commits", :as => :commits
        match "commit/:sha", :action => "show_commit", :sha => /[0-9a-fA-F]{40}/, :via => :get, :as => :show_commit
      end
    end
    member do
      get "feed_commits"
      get "feed_repositories"
    end
  end

  namespace "admin" do
    resources :users
  end

  match "/repositories", :via => :get, :to => "application#repositories"

  root :to => "application#index"
end
