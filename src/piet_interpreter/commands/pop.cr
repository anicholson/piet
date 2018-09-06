module PietInterpreter
  module Commands
    class Pop < Command
      def run(context)
        context.dup.tap do |new_context|
          new_stack = context.stack.dup
          new_stack.pop

          new_context.stack = new_stack
        end
      end
    end
  end
end
