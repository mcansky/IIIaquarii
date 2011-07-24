source 'http://rubygems.org'

gem 'rails', '3.0.9'

gem 'haml'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  # To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
  # gem 'ruby-debug'
  gem 'ruby-debug19'
  gem 'sqlite3'
end

group :production do
  gem 'unicorn'
end

gem 'pg'

# User auth
gem 'authlogic', '~> 3.0'
gem 'sentient_user', :git => 'git://github.com/bokmann/sentient_user.git'

# Rails config files
gem 'rails_config'

# Other
gem 'nifty-generators'

# Git stuff
gem 'grit'
gem 'posix-spawn'

# Versioning
# TODO see if more recent available
gem 'acts_as_versioned', :git => "git://github.com/xspond/acts_as_versioned.git", :branch => "rails3"

# Use jQuery instead of rails default
gem "jquery-rails"

# Friendly ID
gem "friendly_id", "~> 3.2"

# Gravatars
gem 'gravtastic'

# Gems required for markup
gem 'rdiscount'
gem 'RedCloth'
gem 'org-ruby'
gem 'creole'

# Markup for README.bla
gem 'github-markup', :git => "git://github.com/rhaamo/markup.git", :require => 'github/markup'

# Render code
#gem 'albino', :git => "git://github.com/rhaamo/albino.git"
gem 'albino', :git => "git://github.com/jedisct1/albino.git"

# Pagination
gem "will_paginate",:git => "http://github.com/mislav/will_paginate.git", :branch => "rails3"

gem 'fileutils'

# test stuff
group :test do
  gem "shoulda"
  gem 'factory_girl_rails', "1.1.beta1"
  gem "rspec-rails", "2.0.0.beta.12"
  gem 'simplecov', '>=0.3.8', :require => false
end
