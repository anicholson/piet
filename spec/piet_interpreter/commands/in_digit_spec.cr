require "../../spec_helper"

module PietInterpreter
  module Commands
    describe InDigit do
      describe "when STDIN is empty" do
        it "does nothing" do
          context = Context.new

          new_context = InDigit.new.run(context)

          new_context.must_equal context
        end
      end

      describe "when STDIN is not empty" do
        it "reads a char, then pushes its _integer_ value onto the stack" do
          context = Context.new

          context.stdin.push '8'

          new_context = InDigit.new.run(context)

          new_context.stdin.empty?.must_equal true
          new_context.stack.first.must_equal 8
        end

        it "non-digits are an error" do
          context = Context.new

          context.stdin.push 'Z'

          new_context = InDigit.new.run(context)

          new_context.stdin.empty?.must_equal true
          new_context.stack.empty?.must_equal true
        end
      end
    end
  end
end
