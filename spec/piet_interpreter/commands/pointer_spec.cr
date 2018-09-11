require "../../spec_helper"

module PietInterpreter
  module Commands
    describe Pointer do
      it "pops the top number off the stack, and rotates the DP that many steps" do
        context = Context.new

        context.stack = Stack.new([5_i64])

        context.dp.should eq Direction::Right

        new_context = Pointer.new.run(context)

        new_context.stack.empty?.should eq true

        new_context.dp.should_not eq context.dp
        new_context.dp.should eq Direction::Down
      end

      it "can handle counter-clockwise" do
        context = Context.new

        context.stack = Stack.new([-5_i64])

        context.dp.should eq Direction::Right

        new_context = Pointer.new.run(context)

        new_context.stack.empty?.should eq true
        new_context.dp.should eq Direction::Up
      end

      it "ignores if the stack is too small" do
        context = Context.new

        new_context = Pointer.new.run(context)

        context.should eq new_context
      end
    end
  end
end
