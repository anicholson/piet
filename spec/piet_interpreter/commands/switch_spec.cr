require "../../spec_helper"

module PietInterpreter
  module Commands
    describe Switch do
      it "pops the top number off the stack, and rotates the DP that many steps" do
        context = Context.new

        context.stack = Stack.new([5_i64])

        context.cc.should eq CodelChooserDirection::Left

        new_context = Switch.new.run(context)

        new_context.stack.empty?.should eq true
        new_context.cc.should eq CodelChooserDirection::Right
      end

      it "can handle counter-clockwise" do
        context = Context.new

        context.stack = Stack.new([-2_i64])

        context.cc.should eq CodelChooserDirection::Left

        new_context = Switch.new.run(context)

        new_context.stack.empty?.should eq true
        new_context.cc.should eq CodelChooserDirection::Left
      end

      it "ignores if the stack is too small" do
        context = Context.new

        new_context = Switch.new.run(context)

        context.should eq new_context
      end
    end
  end
end
