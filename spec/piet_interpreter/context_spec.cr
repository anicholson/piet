require "../spec_helper"

module PietInterpreter
  describe Context do
    let(subject) { PietInterpreter::Context.new }
    describe "default values" do
      it "has an empty stack" do
        subject.stack.size.must_equal 0
      end

      it "DP points to the right" do
        subject.dp.must_equal Direction::Right
      end

      it "CC points to the left" do
        subject.cc.must_equal CodelChooserDirection::Left
      end

      it "has an empty STDIN" do
        subject.stdin.empty?.must_equal true
      end
    end
  end
end
