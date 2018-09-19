require "../spec_helper"

module PietInterpreter
  describe Stack do
    describe "#roll" do
      it "roll(0) is a no-op" do
        old = Stack.new [1_i64, 2_i64]

        new = old.roll(0)

        new.should eq old
      end

      it "roll(n) on an empty stack is a no-op" do
        old = Stack.new

        new = old.roll(25)

        old.should eq new
      end

      it "pushes the top value down to (depth)th place" do
        old = Stack.new [1_i64, 1_i64, 1_i64, 1_i64, 9_i64]

        new = old.roll(2)

        new.should eq Stack.new([1_i64, 1_i64, 9_i64, 1_i64, 1_i64])
      end
    end
  end
end
