require "../spec_helper"

module PietInterpreter
  describe Direction do
    describe "#toggle" do
      it "moves the number of steps round, clockwise" do
        Direction::Left.toggle(0).should eq Direction::Left
        Direction::Left.toggle(1).should eq Direction::Up
        Direction::Left.toggle(2).should eq Direction::Right
        Direction::Left.toggle(3).should eq Direction::Down
      end

      it "handles large numbers of steps" do
        Direction::Left.toggle(999).should eq Direction::Down
        Direction::Left.toggle(-999).should eq Direction::Up
      end

      it "moves anti-clockwise when passed a negative number" do
        Direction::Right.toggle(-0).should eq Direction::Right
        Direction::Right.toggle(-1).should eq Direction::Up
        Direction::Right.toggle(-2).should eq Direction::Left
        Direction::Right.toggle(-3).should eq Direction::Down
      end
    end
  end

  describe CodelChooserDirection do
    describe "#toggle" do
      it "odd numbers flip" do
        CodelChooserDirection::Left.toggle(3).should eq CodelChooserDirection::Right
        CodelChooserDirection::Right.toggle(-5).should eq CodelChooserDirection::Left
      end

      it "even numbers don't change" do
        CodelChooserDirection::Left.toggle(2).should eq CodelChooserDirection::Left
        CodelChooserDirection::Right.toggle(-12).should eq CodelChooserDirection::Right
      end
    end
  end
end
