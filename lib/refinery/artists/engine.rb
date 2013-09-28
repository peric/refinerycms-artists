module Refinery
  module Artists
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Artists

      engine_name :refinery_artists

      initializer "register refinerycms_artists plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "artists"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.artists_admin_artists_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/artists/artist',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Artists)
      end
    end
  end
end
