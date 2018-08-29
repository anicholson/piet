require "../spec_helper"

image = File.join(__DIR__, "..", "support", "block_size.png")
reader = PietInterpreter::Reader.from_image(image)

module PietInterpreter
  describe CodeBlock do
    it "enforces positive codel size" do
      raised_exception = begin
        CodeBlock.new(Grey::White, 0_u64)
        false
      rescue e : ArgumentError
        e.message.should eq "codel size must be greater than 0"
        true
      end

      raised_exception.should eq true
    end

    describe ".from_location" do
      it "does not treat diagonally-adjacent cells as contiguous" do
        white_corner = CodeBlock.from_location(0, 0, reader)

        white_corner.size.should eq(1)
      end

      it "horizontally-adjacent cells are contiguous" do
        black = CodeBlock.from_location(0, 9, reader)

        black.size.should eq(19)
      end

      it "doesn't include islands of other colours" do
        red = CodeBlock.from_location(0, 1, reader)

        red.size.should eq(47)
      end
    end
  end
end
