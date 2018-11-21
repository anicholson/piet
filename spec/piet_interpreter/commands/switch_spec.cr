require "../../spec_helper"

module PietInterpreter
  module Commands
    describe Switch do
      it "pops the top number off the stack, and rotates the DP that many steps" do
        context = Context.new

        context.stack = Stack.new([5_i64])

        context.cc.must_equal CodelChooserDirection::Left

        new_context = Switch.new.run(context)

        new_context.stack.empty?.must_equal true
        new_context.cc.must_equal CodelChooserDirection::Right
      end

      it "can handle counter-clockwise" do
        context = Context.new

        context.stack = Stack.new([-2_i64])

        context.cc.must_equal CodelChooserDirection::Left

        new_context = Switch.new.run(context)

        new_context.stack.empty?.must_equal true
        new_context.cc.must_equal CodelChooserDirection::Left
      end

      it "ignores if the stack is too small" do
        context = Context.new

        new_context = Switch.new.run(context)

        context.must_equal new_context
      end
    end
  end
end
