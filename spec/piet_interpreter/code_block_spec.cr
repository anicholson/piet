require "../spec_helper"

module PietInterpreter
  describe CodeBlock do
    it "enforces positive codel size" do
      raised_exception = begin
        CodeBlock.new(Grey::White, 0_u64)
        false
      rescue e : ArgumentError
        e.message.should eq "codel size must be greater than 0"
        true
      end

      raised_exception.should eq true
    end
  end
end
