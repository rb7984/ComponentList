module RBb
  module Toolbar
      
    toolbar = UI::Toolbar.new('B')
  
    #add commands
    
    command = UI::Command.new('B') {B.display_dialog}
    
    command.small_icon = command.large_icon = File.join(__dir__, '/icons/', 'icon0.png')
    command.tooltip = 'Prelievo'
    command.status_bar_text = 'distinta di prelievo'
  
    toolbar.add_item(command)
	
    toolbar.show
    
  end  
end