require "../spec_helper"

module PietInterpreter

  describe Reader do
    describe ".from_image" do
      it "works" do
        image = File.join(__DIR__, "../", "support", "fizzbuzz.png")
        Reader.from_image(image).nil?.should be_false
      end
    end

    describe "attributes" do
      it "#width matches image" do
        image = File.join(__DIR__, "../", "support", "fizzbuzz.png")
        Reader.from_image(image).width.should eq 67
      end

      it "#height matchhes image" do
        image = File.join(__DIR__, "../", "support", "fizzbuzz.png")
        Reader.from_image(image).height.should eq 74
      end
    end
  end
end
