module PietInterpreter
  module Commands
    class Noop < Command
      def run(context) : Context
        return context
      end
    end
  end
end
