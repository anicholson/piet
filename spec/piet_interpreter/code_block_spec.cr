require "../spec_helper"

module PietInterpreter
  describe CodeBlock do
    let(image) { File.join(__DIR__, "..", "support", "block_size.png") }
    let(reader) { PietInterpreter::Reader.from_image(image) }

    let(white_corner) { PietInterpreter::CodeBlock.from_location(0, 0, reader) }
    let(black) { PietInterpreter::CodeBlock.from_location(0, 9, reader) }
    let(red) { PietInterpreter::CodeBlock.from_location(0, 1, reader) }

    it "enforces positive codel size" do
      raised_exception = begin
        CodeBlock.new(Grey::White, Set(Point2D).new)
        false
      rescue e : ArgumentError
        e.message.must_equal "codel size must be greater than 0"
        true
      end

      raised_exception.must_equal true
    end

    describe ".from_location" do
      it "does not treat diagonally-adjacent cells as contiguous" do
        white_corner.size.must_equal(1)
      end

      it "horizontally-adjacent cells are contiguous" do
        black.size.must_equal(19)
      end

      it "doesn't include islands of other colours" do
        red.size.must_equal(47)
      end
    end

    describe "#furthest_codel" do
      it "isn't tricked by holes" do
      end
    end
  end
end
