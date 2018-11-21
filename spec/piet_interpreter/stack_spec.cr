require "../spec_helper"

module PietInterpreter
  describe Stack do
    describe "#roll" do
      it "roll(0) is a no-op" do
        old = Stack.new [1_i64, 2_i64]

        new = old.roll(0)

        new.must_equal old
      end

      it "roll(n) on an empty stack is a no-op" do
        old = Stack.new

        new = old.roll(25)

        old.must_equal new
      end

      describe "n is positive" do
        it "pushes the top value down to (depth)th place" do
          old = Stack.new [1_i64, 1_i64, 1_i64, 1_i64, 9_i64]

          new = old.roll(2)

          new.must_equal Stack.new([1_i64, 1_i64, 9_i64, 1_i64, 1_i64])
        end
      end

      describe "n is negative" do
        it "pushes from the bottom instead" do
          old = Stack.new [9_i64, 1_i64, 1_i64, 1_i64, 1_i64]

          new = old.roll(2, top_down: false)

          new.must_equal Stack.new([1_i64, 1_i64, 9_i64, 1_i64, 1_i64])
        end
      end
    end
  end
end
