require "../../spec_helper"

module PietInterpreter
  module Commands
    describe Divide do
      it "pops the top two numbers, integer-divides them, and places the result on the top of the stack" do
        context = Context.new
        context.stack = Stack.new([2_i64, 9_i64, 3_i64])

        new_context = Divide.new.run(context)

        new_context.stack.size.must_equal 2
        new_context.stack.first.must_equal 3
      end

      it "throws the remainder away" do
        context = Context.new
        context.stack = Stack.new([2_i64, 11_i64, 3_i64])

        new_context = Divide.new.run(context)

        new_context.stack.size.must_equal 2
        new_context.stack.first.must_equal 3
      end

      it "ignores if the stack is too small" do
        context = Context.new
        context.stack = Stack.new([2_i64])

        new_context = Divide.new.run(context)

        new_context.must_equal context
      end
    end
  end
end
