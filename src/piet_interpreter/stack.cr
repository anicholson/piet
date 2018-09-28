require "crystalline/containers/stack"
require "delegate"

class Stack(T)
  include Delegate

  def_equals_and_hash @container

  delegate to: @container, methods: [:shift, :unshift]

  def roll(depth : Int, top_down : Bool = true) : self
    return self if depth == 0
    return self if empty?

    self.tap do |s|
      holding_stack = self.class.new

      if top_down
        rolled_value = s.pop
        (depth).times { holding_stack.push(s.pop) }

        s.push(rolled_value)

        until holding_stack.empty?
          s.push(holding_stack.pop)
        end
      else
        rolled_value = s.shift

        (depth).times { holding_stack.unshift(s.shift) }

        s.unshift(rolled_value)

        until holding_stack.empty?
          s.unshift(holding_stack.shift)
        end
      end
    end
  end
end

module PietInterpreter
  alias Stack = ::Stack(Int64)
end
