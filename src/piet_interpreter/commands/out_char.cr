module PietInterpreter
  module Commands
    class OutChar < Command
      def run(context) : Context
        return context if context.stack.empty?

        new_context = context.dup
        new_stack = context.stack.dup
        new_stdin = context.stdin.dup
        new_stdout = context.stdout.dup

        digit = new_stack.pop

        if digit >= 0 && digit <= Char::MAX_CODEPOINT
          new_stdout.push digit.chr
        end

        new_context.stack = new_stack
        new_context.stdin = new_stdin
        new_context.stdout = new_stdout
        new_context
      end
    end
  end
end
