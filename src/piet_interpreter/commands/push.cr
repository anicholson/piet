module PietInterpreter
  module Commands
    class Push < Command
      def run(context)
        new_stack = context.stack.dup

        new_stack.push(context.current_code_block.size.to_i64)

        context.dup.tap do |new_context|
          new_context.stack = new_stack
        end
      end
    end
  end
end
