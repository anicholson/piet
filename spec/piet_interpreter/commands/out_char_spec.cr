require "../../spec_helper"

module PietInterpreter
  module Commands
    describe OutChar do
      describe "when STDIN is empty" do
        it "does nothing" do
          context = Context.new

          new_context = OutChar.new.run(context)

          new_context.must_equal context
        end
      end

      describe "when STDIN is not empty" do
        it "reads a char, then pushes its _integer_ value onto the stack" do
          context = Context.new

          context.stack = Stack.new [99_i64]

          new_context = OutChar.new.run(context)

          new_context.stdout.empty?.must_equal false
          new_context.stack.empty?.must_equal true

          new_context.stdout.first.must_equal 'c'
        end

        it "too-big numbers are an error and ignored" do
          context = Context.new

          context.stack = Stack.new [(Char::MAX_CODEPOINT + 1).to_i64]

          new_context = OutChar.new.run(context)

          new_context.stdout.empty?.must_equal true
          new_context.stack.empty?.must_equal true
        end

        it "negative numbers are an error and are ignored" do
          context = Context.new

          context.stack = Stack.new [-99_i64]

          new_context = OutChar.new.run(context)

          new_context.stdout.empty?.must_equal true
          new_context.stack.empty?.must_equal true
        end
      end
    end
  end
end
