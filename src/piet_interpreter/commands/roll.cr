module PietInterpreter
  module Commands
    class Roll < Command
      def run(context) : Context
        return context if context.stack.size < 2

        new_context = context.dup
        new_stack = context.stack.dup

        rolls = new_stack.pop
        depth = new_stack.pop

        if rolls > 0
          rolls.times { new_stack.roll(depth) }
        elsif rolls < 0
          rolls = rolls * -1

          rolls.times { new_stack.roll(depth, top_down: false) }
        end

        new_context.stack = new_stack
        new_context
      end
    end
  end
end
