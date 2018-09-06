require "../../spec_helper"

module PietInterpreter
  class MockCodeBlock
    include CodeBlock::T

    def colour
      {Lightness::Dark, Hue::Red}
    end

    def size
      10_u64
    end
  end

  describe Commands::Push do
    it "puts the value of the current block onto the stack" do
      code_block = MockCodeBlock.new

      context = Context.new(current_code_block: code_block)

      context.current_code_block = code_block

      new_context = Commands::Push.new.run(context)

      new_context.stack.size.should eq(1)
      new_context.stack.first.should eq(code_block.size)
    end
  end
end
