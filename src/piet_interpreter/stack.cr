require "crystalline/containers/stack"
require "delegate"

class Stack(T)
  def_equals_and_hash @container

  def roll(depth : Int) : self
    return self if depth == 0
    return self if empty?

    self.tap do |s|
      holding_stack = self.class.new

      rolled_value = s.pop
      (depth).times { holding_stack.push(s.pop) }

      s.push(rolled_value)

      until holding_stack.empty?
        s.push(holding_stack.pop)
      end
    end
  end
end

module PietInterpreter
  alias Stack = ::Stack(Int64)
end
