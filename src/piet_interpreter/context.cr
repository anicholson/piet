module PietInterpreter
  struct Context
    getter stack
    getter dp : Direction
    getter cc : CodelChooserDirection

    def initialize
      @stack = Stack.new
      @dp = Direction::Right
      @cc = CodelChooserDirection::Left
    end
  end
end
