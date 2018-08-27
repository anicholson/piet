module PietInterpreter
  struct CodeBlock
    getter colour : Colour
    getter size : UInt64

    def initialize(@colour, @size)
      raise ArgumentError.new("codel size must be greater than 0") unless size > 0

      @size = size
    end
  end
end
