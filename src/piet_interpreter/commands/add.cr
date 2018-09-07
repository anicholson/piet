module PietInterpreter
  module Commands
    class Add < Command
      def run(context) : Context
        return context if context.stack.size < 2
        stack = context.stack.dup

        a = stack.pop
        b = stack.pop

        stack.push(a + b)

        context.dup.tap do |new_context|
          new_context.stack = stack
        end
      end
    end
  end
end
