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
end
