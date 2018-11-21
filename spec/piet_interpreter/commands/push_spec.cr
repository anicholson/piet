require "../../spec_helper"

module PietInterpreter
  class PushSpecMockCodeBlock
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
      code_block = PushSpecMockCodeBlock.new

      context = Context.new(current_code_block: code_block)

      context.current_code_block = code_block

      new_context = Commands::Push.new.run(context)

      new_context.stack.size.must_equal(1)
      new_context.stack.first.must_equal(code_block.size)
    end
  end
end
