module PietInterpreter
  module Commands
    class Mod < Command
      def run(context)
        return context if context.stack.size < 2

        context.dup.tap do |new_context|
          new_stack = context.stack.dup
          a = new_stack.pop
          b = new_stack.pop

          result = (b % a)
          new_stack.push(result)

          new_context.stack = new_stack
        end
      end
    end
  end
end
