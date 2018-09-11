module PietInterpreter
  struct Context
    property stack
    property dp : Direction
    property cc : CodelChooserDirection
    property current_code_block : CodeBlock::T
    getter stdin : Deque(Char)

    def initialize(@stack = Stack.new, @dp = Direction::Right, @cc = CodelChooserDirection::Left, @current_code_block = CodeBlock::NULL)
      @stdin = Deque(Char).new
    end

    def current_code_block
      @current_code_block
    end
  end
end
