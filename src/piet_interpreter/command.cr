module PietInterpreter
  abstract class Command
    abstract def run(context : Context) : Context
  end
end
