module PietInterpreter
  module Commands
    class Dup < Command
      def run(context)
        return context if context.stack.empty?

        context.dup.tap do |new_context|
          new_stack = context.stack.dup
          a = new_stack.pop

          new_stack.push(a)
          new_stack.push(a)

          new_context.stack = new_stack
        end
      end
    end
  end
end
