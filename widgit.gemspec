# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'widgit/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'widgit-cms'
  s.version     = Widgit::VERSION
  s.authors     = ['Johan Frølich']
  s.email       = ['johanfrolich@gmail.com']
  s.homepage    = 'https://github.com/jokklan/widgit-cms'
  s.summary     = 'A modern, higly flexible CMS system for Rails'
  s.description = 'A modern, higly flexible CMS system for Rails'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails',                '~> 4.2.0.beta2'
  s.add_dependency 'haml',                 '~> 4.0.5'
  s.add_dependency 'bootstrap-sass',       '~> 3.2.0'
  s.add_dependency 'bh',                   '~> 1.1'

  # Use jquery as the JavaScript library
  s.add_dependency 'jquery-rails', '~> 3.1.2'

  s.add_dependency 'simple_form', '~> 3.0.2'
end
