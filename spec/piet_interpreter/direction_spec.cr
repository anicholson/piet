require "../spec_helper"

module PietInterpreter
  describe Direction do
    describe "#toggle" do
      it "moves the number of steps round, clockwise" do
        Direction::Left.toggle(0).must_equal Direction::Left
        Direction::Left.toggle(1).must_equal Direction::Up
        Direction::Left.toggle(2).must_equal Direction::Right
        Direction::Left.toggle(3).must_equal Direction::Down
      end

      it "handles large numbers of steps" do
        Direction::Left.toggle(999).must_equal Direction::Down
        Direction::Left.toggle(-999).must_equal Direction::Up
      end

      it "moves anti-clockwise when passed a negative number" do
        Direction::Right.toggle(-0).must_equal Direction::Right
        Direction::Right.toggle(-1).must_equal Direction::Up
        Direction::Right.toggle(-2).must_equal Direction::Left
        Direction::Right.toggle(-3).must_equal Direction::Down
      end
    end
  end

  describe CodelChooserDirection do
    describe "#toggle" do
      it "odd numbers flip" do
        CodelChooserDirection::Left.toggle(3).must_equal CodelChooserDirection::Right
        CodelChooserDirection::Right.toggle(-5).must_equal CodelChooserDirection::Left
      end

      it "even numbers don't change" do
        CodelChooserDirection::Left.toggle(2).must_equal CodelChooserDirection::Left
        CodelChooserDirection::Right.toggle(-12).must_equal CodelChooserDirection::Right
      end
    end
  end
end
