module PietInterpreter
  class Program
    def self.from_file(file_name : String)
      reader = Reader.new(file_name)
      new(reader)
    end

    private def initialize(@reader)
      @context = Context.new
    end

    private getter reader : Reader
    private getter context : Context
  end
end
