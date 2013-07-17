source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.0.1'
gem 'will_paginate', '3.0.4'
gem 'jquery-rails', '2.0.2'
gem 'simple_form'
gem 'populator'
gem 'cancan'
gem 'acts-as-taggable-on'
gem 'devise'

# Added 4-29-13
gem 'acts_as_votable', '~> 0.5.0'
gem "whenever", "~> 0.8.2"

# Added 4-23-13
gem "recaptcha", :require => "recaptcha/rails"
gem "delayed_job", "~> 3.0.5"
gem 'omniauth-twitter', :github => 'arunagw/omniauth-twitter'

# Added 4-21-13
gem "rake", "~> 10.0.4"

# Added 4-17-13
gem "twitter", "~> 4.6.2"

group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '1.2.1'
  gem 'guard-spork', '1.2.0'  
  gem 'spork', '0.9.2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '4.1.0'
  gem 'cucumber-rails', '1.2.1', :require => false
  gem 'database_cleaner', '0.7.0'
  # gem 'launchy', '2.1.0'
  # gem 'rb-fsevent', '0.9.1', :require => false
  # gem 'growl', '1.0.3'
end

group :production do
  gem 'pg', '0.12.2'
end