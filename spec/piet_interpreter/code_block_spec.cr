require "../spec_helper"

image = File.join(__DIR__, "..", "support", "block_size.png")
reader = PietInterpreter::Reader.from_image(image)

white_corner = PietInterpreter::CodeBlock.from_location(0, 0, reader)
black = PietInterpreter::CodeBlock.from_location(0, 9, reader)
red = PietInterpreter::CodeBlock.from_location(0, 1, reader)

module PietInterpreter
  describe CodeBlock do
    it "enforces positive codel size" do
      raised_exception = begin
        CodeBlock.new(Grey::White, Set(Point2D).new)
        false
      rescue e : ArgumentError
        e.message.should eq "codel size must be greater than 0"
        true
      end

      raised_exception.should eq true
    end

    describe ".from_location" do
      it "does not treat diagonally-adjacent cells as contiguous" do
        white_corner.size.should eq(1)
      end

      it "horizontally-adjacent cells are contiguous" do
        black.size.should eq(19)
      end

      it "doesn't include islands of other colours" do
        red.size.should eq(47)
      end
    end

    describe "#furthest_codel" do
      it "isn't tricked by holes" do
      end
    end
  end
end
