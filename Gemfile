source 'http://rubygems.org'

gem 'rails', '3.2.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'nifty-generators'

group :development do 
  gem 'rails-footnotes', '>= 3.7.5.rc4'
  gem 'yard'
  # Needed for generating YARD
  gem 'redcarpet'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'syntax'  # for syntax highlighting in TextMate
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'devise', '>= 2.0.0'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'growl'
end

group :test do 
  # After configured, use `bundle exec guard` to get this going
  gem 'spork', '> 0.9.0.rc'
  gem 'guard-spork'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
