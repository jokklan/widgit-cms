# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'widgit/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'construct_io'
  s.version     = Widgit::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Johan Frølich', 'Joachim Blicher Lundberg', 'Theis Othmar Frøhlich']
  s.homepage    = 'https://github.com/jokklan/widgit-cms'
  s.summary     = 'A modern, higly flexible CMS system for Rails'
  s.description = 'A modern, higly flexible CMS system for Rails'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'rails',                '>= 4.1.0'
  s.add_dependency 'haml',                 '>= 4.0.5'
  s.add_dependency 'bootstrap-sass',       '>= 3.2.0'
  s.add_dependency 'bh',                   '>= 1.1'

  # Use jquery as the JavaScript library
  s.add_dependency 'jquery-rails', '>= 3.1.2'

  s.add_dependency 'simple_form', '>= 3.0.2'

  # Font icon pack from Font Awesome
  s.add_dependency 'font-awesome-sass', '>= 4.2.0'

  # Use SCSS for stylesheets
  s.add_dependency 'sass-rails', '>= 5.0.0'
  s.add_dependency 'compass-rails'

  # Use CoffeeScript for .js.coffee assets and views
  s.add_dependency 'coffee-rails', '>= 4.0.0'

  # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
  s.add_dependency 'turbolinks', '>= 2.4.0'

  # Typecast hstore attributes
  s.add_dependency 'hstore_accessor', '>= 0.6.1'

  # Use postgresql as the database for Active Record
  s.add_dependency 'pg', '>= 0.17.0'

  # Use postgresql as the database for Active Record
  s.add_dependency 'apotomo', '>= 1.3.0'

  # jQuery UI for Rails assets pipeline
  s.add_dependency 'jquery-ui-rails', '>= 5.0.2'

  # Use dropzone js for fileupload interface
  s.add_dependency 'dropzonejs-rails'

  # Use carrierwave for fileupload
  s.add_dependency 'carrierwave'

  # Use react js as javascript framework for interactive view components
  s.add_dependency 'react-rails', '~> 1.0.0.pre'

  # Better JSX syntax in CoffeeScript
  s.add_dependency 'sprockets-coffee-react'

  # Evaluate javascript code in ruby
  s.add_dependency 'therubyracer'
end
