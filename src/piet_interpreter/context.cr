module PietInterpreter
  struct Context
    property stack
    getter dp : Direction
    getter cc : CodelChooserDirection
    property current_code_block : CodeBlock::T

    def initialize(@stack = Stack.new, @dp = Direction::Right, @cc = CodelChooserDirection::Left, @current_code_block = nil)
    end

    def current_code_block
      @current_code_block
    end
  end
end
