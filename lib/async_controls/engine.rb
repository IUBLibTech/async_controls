module AsyncControls
  class Engine < ::Rails::Engine
    isolate_namespace AsyncControls

    config.autoload_paths += %W(
      #{config.root}/app/helpers
      #{config.root}/app/presenters
      #{config.root}/lib/async_controls
    )
  end
end
