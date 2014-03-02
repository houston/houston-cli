require "houston/cli/version"

module Houston
  module CLI
    
    def self.new_module!
      require "houston/cli/houston_module_generator"
      HoustonModuleGenerator.start
    end
    
  end
end
