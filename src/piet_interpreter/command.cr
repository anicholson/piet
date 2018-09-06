module PietInterpreter
  module Commands
    abstract class Command
      abstract def run(context) : Context
    end
  end
end

require "./commands/*"
