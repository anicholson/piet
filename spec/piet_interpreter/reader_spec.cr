require "../spec_helper"

module PietInterpreter
  describe Reader do
    describe ".from_image" do
      it "works" do
        image = File.join(__DIR__, "../", "support", "fizzbuzz.png")
        Reader.from_image(image).nil?.must_equal false
      end
    end

    describe "attributes" do
      it "#width matches image" do
        image = File.join(__DIR__, "../", "support", "fizzbuzz.png")
        Reader.from_image(image).width.must_equal 67
      end

      it "#height matches image" do
        image = File.join(__DIR__, "../", "support", "fizzbuzz.png")
        Reader.from_image(image).height.must_equal 74
      end
    end

    describe "reading a pixel" do
      it "[0,0] returns the top-left corner" do
        image = File.join(__DIR__, "../", "support", "tiny.png")
        pixel = Reader.from_image(image).get(0, 0)

        pixel.must_equal StumpyCore::RGBA::BLACK
      end

      it "[width-1, 0] returns the top-right corner" do
        image = File.join(__DIR__, "../", "support", "tiny.png")
        reader = Reader.from_image(image)
        pixel = reader.get(reader.width - 1, 0)

        pixel.must_equal StumpyCore::RGBA::RED
      end

      it "[0, height-1] returns the bottom-left corner" do
        image = File.join(__DIR__, "../", "support", "tiny.png")
        reader = Reader.from_image(image)
        pixel = reader.get(0, reader.height - 1)

        pixel.must_equal StumpyCore::RGBA::BLUE
      end

      it "[width-1, height-1] returns the bottom-right corner" do
        image = File.join(__DIR__, "../", "support", "tiny.png")
        reader = Reader.from_image(image)
        pixel = reader.get(reader.width - 1, reader.height - 1)

        pixel.must_equal StumpyCore::RGBA::WHITE
      end
    end
  end
end
