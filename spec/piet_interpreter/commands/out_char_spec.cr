require "../../spec_helper"

module PietInterpreter
  module Commands
    describe OutChar do
      describe "when STDIN is empty" do
        it "does nothing" do
          context = Context.new

          new_context = OutChar.new.run(context)

          new_context.should eq context
        end
      end

      describe "when STDIN is not empty" do
        it "reads a char, then pushes its _integer_ value onto the stack" do
          context = Context.new

          context.stack = Stack.new [99_i64]

          new_context = OutChar.new.run(context)

          new_context.stdout.empty?.should eq false
          new_context.stack.empty?.should eq true

          new_context.stdout.first.should eq 'c'
        end

        it "too-big numbers are an error and ignored" do
          context = Context.new

          context.stack = Stack.new [(Char::MAX_CODEPOINT + 1).to_i64]

          new_context = OutChar.new.run(context)

          new_context.stdout.empty?.should eq true
          new_context.stack.empty?.should eq true
        end

        it "negative numbers are an error and are ignored" do
          context = Context.new

          context.stack = Stack.new [-99_i64]

          new_context = OutChar.new.run(context)

          new_context.stdout.empty?.should eq true
          new_context.stack.empty?.should eq true
        end
      end
    end
  end
end
