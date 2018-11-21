require "../../spec_helper"

module PietInterpreter
  module Commands
    describe OutDigit do
      describe "when STDIN is empty" do
        it "does nothing" do
          context = Context.new

          new_context = OutDigit.new.run(context)

          new_context.must_equal context
        end
      end

      describe "when STDIN is not empty" do
        it "reads a char, then pushes its _integer_ value onto the stack" do
          context = Context.new

          context.stack = Stack.new [9_i64]

          new_context = OutDigit.new.run(context)

          new_context.stdout.empty?.must_equal false
          new_context.stack.empty?.must_equal true

          new_context.stdout.first.must_equal '9'
        end

        it "too-big numbers are an error and are ignored" do
          context = Context.new

          context.stack = Stack.new [99_i64]

          new_context = OutDigit.new.run(context)

          new_context.stdout.empty?.must_equal true
          new_context.stack.empty?.must_equal true
        end

        it "negative numbers are an error and are ignored" do
          context = Context.new

          context.stack = Stack.new [-99_i64]

          new_context = OutDigit.new.run(context)

          new_context.stdout.empty?.must_equal true
          new_context.stack.empty?.must_equal true
        end
      end
    end
  end
end
