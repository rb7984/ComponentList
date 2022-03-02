require 'sketchup.rb'

module RBb
  
  module B
    
	def self.doThing
	
	  model = Sketchup.active_model
      entities = model.active_entities

      instances_count = entities.grep(Sketchup::ComponentInstance).size.to_s
      instances = entities.grep(Sketchup::ComponentInstance)
      names = ""
      
        for i in instances do
            names += "\n"
            names += i.definition.name.split('#',2)[0]
        end
		
		names.slice!(0)
		
		File.write(File.join(__dir__, 'tmp.txt'), names)
		
		self.notification names
	end
	
    def self.notification(a)
            
      notification = UI::Notification.new(Sketchup.extensions[0], a)
      notification.on_dismiss("Close") {close}
      notification.show
     
    end
    
    def self.create_dialog
      
      options = {
        dialog_title: 'Count',
        style: UI::HtmlDialog::STYLE_DIALOG,
        height: 130,
        width: 300
      }
      dialog = UI::HtmlDialog.new(options)
      dialog.set_size(options[:width], options[:height])
      dialog.set_file(File.join(__dir__, "dialog.html"))
      dialog.center
      
      dialog
      
    end
    
    def self.display_dialog
     
      dialog = create_dialog
      dialog.add_action_callback("doThing") { |_|
        doThing
        }
      dialog.show
      
    end
    
    require 'b/toolbar.rb'
   
  end
end