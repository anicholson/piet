module PietInterpreter
  module Commands
    class Not < Command
      def run(context)
        return context if context.stack.empty?

        context.dup.tap do |new_context|
          new_stack = context.stack.dup
          a = new_stack.pop

          result = a == 0 ? 1_i64 : 0_i64
          new_stack.push(result)

          new_context.stack = new_stack
        end
      end
    end
  end
end
