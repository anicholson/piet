require "../../spec_helper"

module PietInterpreter
  module Commands
    describe InDigit do
      describe "when STDIN is empty" do
        it "does nothing" do
          context = Context.new

          new_context = InDigit.new.run(context)

          new_context.should eq context
        end
      end

      describe "when STDIN is not empty" do
        it "reads a char, then pushes its _integer_ value onto the stack" do
          context = Context.new

          context.stdin.push '8'

          new_context = InDigit.new.run(context)

          new_context.stdin.empty?.should eq true
          new_context.stack.first.should eq 8
        end

        it "non-digits are an error" do
          context = Context.new

          context.stdin.push 'Z'

          new_context = InDigit.new.run(context)

          new_context.stdin.empty?.should eq true
          new_context.stack.empty?.should eq true
        end
      end
    end
  end
end
