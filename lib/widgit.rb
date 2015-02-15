require 'widgit/version'
require 'widgit/dependencies'
require 'widgit/engine'
require "compass-rails"

module Widgit
  mattr_accessor :components
  @@components = %w(header icon image text)

end
