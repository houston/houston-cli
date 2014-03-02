require "rails"
require "rails/generators"
require "rails/generators/rails/plugin_new/plugin_new_generator"

# When upgrading from Rails 3.2.* to 4.0:
#  replace `empty_directory_with_gitkeep` with `empty_directory_with_keep_file`

class HoustonModuleBuilder < Rails::PluginBuilder
  
  def app
    if mountable?
      directory "app"
      empty_directory_with_gitkeep "app/assets/images/houston/#{name}"
    elsif full?
      empty_directory_with_gitkeep "app/models"
      empty_directory_with_gitkeep "app/controllers"
      empty_directory_with_gitkeep "app/views"
      empty_directory_with_gitkeep "app/helpers"
      empty_directory_with_gitkeep "app/mailers"
      empty_directory_with_gitkeep "app/assets/images/houston/#{name}"
    end
  end
  
  def lib
    template "lib/houston/%name%.rb"
    template "lib/houston/%name%/engine.rb"
    template "lib/houston/%name%/version.rb"
    template "lib/houston-%name%.rb"
    template "lib/tasks/%name%_tasks.rake"
  end
  
  def gemspec
    template "houston-%name%.gemspec"
  end
  
  def stylesheets
    # do nothing
  end

  def javascripts
    # do nothing
  end
  
end

class HoustonModuleGenerator < Rails::Generators::PluginNewGenerator
  source_root File.expand_path("templates", File.dirname(__FILE__))
  
  alias_method :module_name, :app_path
  
  def name
    module_name
  end
  
  def app_path
    "houston-#{name}"
  end
  
  # This is what `valid_const?` tests for validity
  def original_name
    module_name
  end
  
  def get_builder_class
    HoustonModuleBuilder
  end
  
  def full?
    true
  end
  
  def mountable?
    true
  end
  
  def engine?
    true
  end
  
end
