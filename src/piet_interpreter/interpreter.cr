module PietInterpreter
  class Interpreter
    def load_program(program : Program)
      @program = program
    end

    def tick
      program.try do |prog|
        program.handle_tick
      end
    end

    private getter program : Program?
  end
end
