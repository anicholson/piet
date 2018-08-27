require "crystalline/containers/stack"

module PietInterpreter
  class Interpreter
    def initialize
      @stack = Stack(UInt64).new
      @dp = Direction::Right
    end
  end
end
