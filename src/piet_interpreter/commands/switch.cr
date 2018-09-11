module PietInterpreter
  module Commands
    class Switch < Command
      def run(context) : Context
        return context if context.stack.empty?

        new_context = context.dup

        new_stack = context.stack.dup
        steps = new_stack.pop

        new_cc = context.cc.toggle(steps)

        new_context.stack = new_stack
        new_context.cc = new_cc

        new_context
      end
    end
  end
end
