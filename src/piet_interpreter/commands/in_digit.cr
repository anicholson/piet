module PietInterpreter
  module Commands
    class InDigit < Command
      def run(context) : Context
        return context if context.stdin.empty?

        new_context = context.dup
        new_stack = context.stack.dup
        new_stdin = context.stdin.dup
        char = new_stdin.shift

        if char.ascii_number?
          new_stack.push char.to_i64

          new_context.stack = new_stack
        end

        new_context.stdin = new_stdin
        new_context
      end
    end
  end
end
