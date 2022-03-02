# Copyright 2016 Trimble Inc
# Licensed under the MIT license

require 'sketchup.rb'
require 'extensions.rb'

module RBb
  module B

    unless file_loaded?(__FILE__)
      extension = SketchupExtension.new('B', 'b/main')
      extension.description = 'SketchUp Ruby API example creating a geometry.'
      extension.version     = '1.0.0'
      extension.copyright   = 'Trimble Navigations © 2016'
      extension.creator     = 'SketchUp'
      Sketchup.register_extension(extension, true)
      file_loaded(__FILE__)
    end

  end
end