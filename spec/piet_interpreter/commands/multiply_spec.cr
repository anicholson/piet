require "../../spec_helper"

module PietInterpreter
  module Commands
    describe Multiply do
      it "pops the top two numbers, multiplies them, and places the result on the top of the stack" do
        context = Context.new
        context.stack = Stack.new([2_i64, 3_i64, 5_i64])

        new_context = Multiply.new.run(context)

        new_context.stack.size.should eq 2
        new_context.stack.first.should eq 15
      end

      it "ignores if the stack is too small" do
        context = Context.new
        context.stack = Stack.new([2_i64])

        new_context = Multiply.new.run(context)

        new_context.should eq context
      end
    end
  end
end
