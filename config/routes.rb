IIIaquarii::Application.routes.draw do
  devise_for :users

  resources :ssh_keys
  resources :users
  #resources :aq_repositories # nested on :users
  resources :users do
    resources :aq_repositories do
      member do
        get "fork", :action => "fork"
        match "(:branch)/dirs/(:dir)", :action => "show", :dir => /(.*)/, :branch => /(.*)/, :via => :get, :as => :show_dir
        match "(:branch)/files/(:file_path)", :action => "view_file", :file_path => /(.*)/, :branch => /(.*)/, :via => :get, :as => :show_file
        get "(:branch)/commits", :action => "show_commits", :as => :commits, :branch => /(.*)/
        match "(:branch)/commits/:sha", :action => "show_commit", :sha => /[0-9a-fA-F]{40}/, :branch => /(.*)/, :via => :get, :as => :show_commit

        # Always put on the end beacause it's a "catch all"-like route
        match "(:branch)", :action => "show", :branch => /(.*)/, :via => :get
      end
    end
  end

  match "/repositories", :via => :get, :to => "application#repositories"

  root :to => "application#index"
end
