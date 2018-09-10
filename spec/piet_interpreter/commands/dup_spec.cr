require "../../spec_helper"

module PietInterpreter
  module Commands
    describe Dup do
      it "pops the top number, then pushes it back twice" do
        context = Context.new
        context.stack = Stack.new([3_i64, 2_i64])

        new_context = Dup.new.run(context)

        new_context.stack.size.should eq 3

        a = new_context.stack.pop
        b = new_context.stack.pop

        a.should eq b
        a.should eq 2
      end

      it "ignores if the stack is too small" do
        context = Context.new

        new_context = Dup.new.run(context)

        new_context.should eq context
      end
    end
  end
end
