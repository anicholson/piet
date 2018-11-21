require "../../spec_helper"

module PietInterpreter
  module Commands
    describe Not do
      describe "pops the top number, compares result with 0 , and places the result on the top of the stack" do
        it "zero becomes 1" do
          context = Context.new
          context.stack = Stack.new([0_i64])

          new_context = Not.new.run(context)

          new_context.stack.size.must_equal 1
          new_context.stack.first.must_equal 1
        end

        it "non-zero (positive) becomes 0" do
          context = Context.new
          context.stack = Stack.new([1_i64])

          new_context = Not.new.run(context)

          new_context.stack.size.must_equal 1
          new_context.stack.first.must_equal 0
        end

        it "non-zero (negative) becomes 0" do
          context = Context.new
          context.stack = Stack.new([-27_i64])

          new_context = Not.new.run(context)

          new_context.stack.size.must_equal 1
          new_context.stack.first.must_equal 0
        end
      end

      it "ignores if the stack is too small" do
        context = Context.new

        new_context = Not.new.run(context)

        new_context.must_equal context
      end
    end
  end
end
