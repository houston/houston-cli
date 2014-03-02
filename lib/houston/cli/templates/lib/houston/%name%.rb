require "houston/<%= name %>/engine"

module Houston
  module <%= camelized %>
    extend self
    
    
    # Add menu items to Houston's navigation
    def menu_items_for(context={})
      []
    end
    
    
  end
end
