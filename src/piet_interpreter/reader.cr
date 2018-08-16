require "stumpy_png"

module PietInterpreter
  class Reader
    def initialize(@canvas : StumpyCore::Canvas)
    end

    def self.from_image(file_name)
      new StumpyPNG.read(file_name)
    end

    def width
      canvas.width
    end

    def height
      canvas.height
    end

    private getter canvas
  end
end
