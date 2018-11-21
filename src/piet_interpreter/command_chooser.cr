module PietInterpreter
  struct CommandChooser
    # nodoc
    alias C = ::PietInterpreter::Commands

    MAPPING = [
      [C::Noop, C::Push, C::Pop],
      [C::Add, C::Subtract, C::Multiply],
      [C::Divide, C::Mod, C::Not],
      [C::Greater, C::Pointer, C::Switch],
      [C::Dup, C::Roll, C::InDigit],
      [C::InChar, C::OutDigit, C::OutChar],
    ]

    def self.call(hue_change, light_change) : Commands::Command
      MAPPING[hue_change][light_change].new
    end
  end
end
