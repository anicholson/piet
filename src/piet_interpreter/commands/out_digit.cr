module PietInterpreter
  module Commands
    class OutDigit < Command
      def run(context) : Context
        return context if context.stack.empty?

        new_context = context.dup
        new_stack = context.stack.dup
        new_stdin = context.stdin.dup
        new_stdout = context.stdout.dup

        digit = new_stack.pop

        if digit < 10 && digit >= 0
          new_stdout.push digit.to_s.chars.first
        end

        new_context.stack = new_stack
        new_context.stdin = new_stdin
        new_context.stdout = new_stdout
        new_context
      end
    end
  end
end
