require "../../spec_helper"

module PietInterpreter
  module Commands
    describe Pop do
      it "throws the top value of the stack away" do
        context = Context.new
        context.stack = Stack.new([2_i64, 1_i64])

        new_context = Pop.new.run(context)

        new_context.stack.size.must_equal 1
        new_context.stack.first.must_equal 2
      end

      it "ignores if the stack is empty" do
        context = Context.new

        new_context = Pop.new.run(context)

        new_context.must_equal context
      end
    end
  end
end
