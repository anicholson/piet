require "../../spec_helper"

module PietInterpreter
  module Commands
    describe Greater do
      describe "pops the top two numbers, compares them, and places the result on the top of the stack" do
        it "second-top is greater pushes 1" do
          context = Context.new
          context.stack = Stack.new([3_i64, 2_i64])

          new_context = Greater.new.run(context)

          new_context.stack.size.must_equal 1
          new_context.stack.first.must_equal 1
        end

        it "second-top not greater pushes 0" do
          context = Context.new
          context.stack = Stack.new([-1_i64, 1_i64])

          new_context = Greater.new.run(context)

          new_context.stack.size.must_equal 1
          new_context.stack.first.must_equal 0
        end
      end

      it "ignores if the stack is too small" do
        context = Context.new

        new_context = Greater.new.run(context)

        new_context.must_equal context
      end
    end
  end
end
