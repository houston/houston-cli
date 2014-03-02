module Houston
  module <%= camelized %>
    class Engine < ::Rails::Engine
      isolate_namespace Houston::<%= camelized %>
      
      # Enabling assets precompiling under rails 3.1
      if Rails.version >= '3.1'
        initializer :assets do |config|
          Rails.application.config.assets.precompile += %w(
            houston/<%= name %>/application.js
            houston/<%= name %>/application.css )
        end
      end
      
    end
  end
end
