# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "widgit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "WidgIt CMS"
  s.version     = Widgit::VERSION
  s.authors     = ["Johan Frølich"]
  s.email       = ["johanfrolich@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Widgit."
  s.description = "TODO: Description of Widgit."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0.beta2"
end
