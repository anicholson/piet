require "../../spec_helper"

module PietInterpreter
  module Commands
    describe Roll do
      describe "when fewer than 2 values on the stack" do
        it "is a no-op" do
          context = Context.new(stack: Stack.new([1_i64]))

          new_context = Roll.new.run(context)

          context.must_equal new_context
        end
      end

      describe "pops two values off the stack (rolls) & (depth)" do
        it "negative depth is an ignorable error" do
          context = Context.new(stack: Stack.new [-1_i64, 2_i64])
          new_context = Roll.new.run(context)

          new_context.stack.empty?.must_equal true
        end

        it "throws the top two away" do
          stack = Stack.new [4_i64, 3_i64, 2_i64, 1_i64, 1_i64, 1_i64]
          context = Context.new(stack: stack)

          new_context = Roll.new.run(context)

          new_context.stack.size.must_equal 4
        end

        describe "when rolls = 0" do
          it "is a no-op" do
            first_stack = Stack.new [4_i64, 3_i64, 2_i64, 1_i64, 1_i64, 0_i64]
            expected_stack = Stack.new [4_i64, 3_i64, 2_i64, 1_i64]
            context = Context.new(stack: first_stack)

            new_context = Roll.new.run(context)

            new_context.stack.must_equal expected_stack
          end
        end

        describe "when rolls = 1" do
          describe "when depth = 1" do
            it "rolls that depth" do
              first_stack = Stack.new [4_i64, 3_i64, 2_i64, 1_i64, 1_i64, 1_i64]
              expected_stack = Stack.new [4_i64, 3_i64, 1_i64, 2_i64]
              context = Context.new(stack: first_stack)

              new_context = Roll.new.run(context)

              new_context.stack.must_equal expected_stack
            end
          end

          describe "when depth = 2" do
            it "rolls that depth" do
              first_stack = Stack.new [4_i64, 3_i64, 2_i64, 1_i64, 2_i64, 1_i64]
              expected_stack = Stack.new [4_i64, 1_i64, 3_i64, 2_i64]
              context = Context.new(stack: first_stack)

              new_context = Roll.new.run(context)

              new_context.stack.must_equal expected_stack
            end
          end
        end

        describe "when rolls = 2" do
          describe "when depth = 2" do
            it "rolls that depth twice" do
              first_stack = Stack.new [4_i64, 3_i64, 2_i64, 1_i64, 2_i64, 2_i64]
              expected_stack = Stack.new [4_i64, 2_i64, 1_i64, 3_i64]
              context = Context.new(stack: first_stack)

              new_context = Roll.new.run(context)

              new_context.stack.must_equal expected_stack
            end
          end

          describe "when depth is negative (-1)" do
            it "rolls in the opposite direction" do
              first_stack = Stack.new [4_i64, 3_i64, 2_i64, 1_i64, 2_i64, -1_i64]
              expected_stack = Stack.new [3_i64, 2_i64, 4_i64, 1_i64]
              context = Context.new(stack: first_stack)

              new_context = Roll.new.run(context)

              new_context.stack.must_equal expected_stack
            end
          end
        end
      end
    end
  end
end
