require "../spec_helper"

subject = PietInterpreter::Context.new

module PietInterpreter
  describe Context do
    describe "default values" do
      it "has an empty stack" do
        subject.stack.size.should eq 0
      end

      it "DP points to the right" do
        subject.dp.should eq Direction::Right
      end

      it "CC points to the left" do
        subject.cc.should eq CodelChooserDirection::Left
      end
    end
  end
end
