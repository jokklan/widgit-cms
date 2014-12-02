module Widgit
  class Engine < ::Rails::Engine
    isolate_namespace Widgit

    # Add admin assets to be precompiled
    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w(widgit/admin.js)
      Rails.application.config.assets.precompile += %w(widgit.css)
    end

    # Add app/widgets to view path, for apotomo
    initializer :apotomo do |config|
      Apotomo::Widget.append_view_path root + 'app/widgets'
    end
  end
end
