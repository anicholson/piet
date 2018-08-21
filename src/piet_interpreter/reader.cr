require "stumpy_png"
require "delegate"

module PietInterpreter
  class Reader
    include Delegate

    def initialize(@canvas : StumpyCore::Canvas)
    end

    def self.from_image(file_name)
      new StumpyPNG.read(file_name)
    end

    delegate to: canvas, methods: [height, width, :[]]

    private getter canvas
  end
end
