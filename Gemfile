source 'https://rubygems.org'

ruby '2.2.0'

# Temporary gem versions
gem 'react-rails', '~> 1.0.0.pre', github: 'reactjs/react-rails'

gemspec

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Analyse code for best practices problems
  gem 'rails_best_practices'

  # Use Rails Panel with meta request (see https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg)
  gem 'meta_request'

  # Improve error page in development
  gem 'better_errors'

  # Add terminal to error page in development
  gem 'binding_of_caller'

  # Analyse code for database query performance problems
  gem 'bullet'

  # Analyse code for security bugs
  gem 'brakeman', require: false
end

group :development, :test do
  # To use a debugger
  gem 'byebug'

  # Use guard for automated testing
  gem 'guard-rspec', require: false

  # Detects file changes in Mac OS X
  gem 'rb-fsevent', require: false

  # Testing and BDD with RSpec
  gem 'rspec-rails'

  # Create testing data with Factory Girl
  gem 'factory_girl_rails'

  # Ruby shell replacement for IRB
  gem 'pry'

  # Use Pry as default Ruby shell with Rails console
  gem 'pry-rails'

  # Allow remote access to Pry
  gem 'pry-remote'

  # Explore the stack in backtracks, with Pry
  gem 'pry-stack_explorer'

  # Debug code with Pry and byebug
  gem 'pry-byebug'

  # Catch and show emails locally
  gem 'mailcatcher'

  # Easy application bootup with foreman
  gem 'foreman'
end

group :test do
  # Features testing in a headless browser with Capybara
  gem 'capybara'

  # Javascript testing in Capybara with PhantomJS
  gem 'poltergeist'

  # Test time dependent features with timecop
  gem 'timecop'

  # Debug feature tests by opening up your browser and show the current state
  gem 'launchy'

  # Test coverage analysis with simplecov
  gem 'simplecov', require: false
end
