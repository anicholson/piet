module PietInterpreter
  module Commands
    class Pointer < Command
      def run(context) : Context
        return context if context.stack.empty?

        new_context = context.dup

        new_stack = context.stack.dup
        steps = new_stack.pop

        new_dp = context.dp.toggle(steps)

        new_context.stack = new_stack
        new_context.dp = new_dp

        new_context
      end
    end
  end
end
