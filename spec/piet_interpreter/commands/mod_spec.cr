require "../../spec_helper"

module PietInterpreter
  module Commands
    describe Mod do
      it "pops the top two numbers, modulos the 2nd by the top, and places the result on the top of the stack" do
        context = Context.new
        context.stack = Stack.new([2_i64, 9_i64, 3_i64])

        new_context = Mod.new.run(context)

        new_context.stack.size.should eq 2
        new_context.stack.first.should eq 0
      end

      it "throws the remainder away" do
        context = Context.new
        context.stack = Stack.new([2_i64, 11_i64, 3_i64])

        new_context = Mod.new.run(context)

        new_context.stack.size.should eq 2
        new_context.stack.first.should eq 2
      end

      it "ignores if the stack is too small" do
        context = Context.new
        context.stack = Stack.new([2_i64])

        new_context = Mod.new.run(context)

        new_context.should eq context
      end
    end
  end
end
