module PietInterpreter
  struct CommandChooser
    MAPPING = [
      [Commands::Noop, Commands::Push, Commands::Pop],
      [Commands::Add, Commands::Subtract, Commands::Multiply],
      [Commands::Divide, Commands::Mod, Commands::Not],
      [Commands::Greater, Commands::Pointer, Commands::Switch],
      [Commands::Dup, Commands::Roll, Commands::InDigit],
      [Commands::InChar, Commands::OutDigit, Commands::OutChar],
    ]

    def self.call(hue_change, light_change) : Commands::Command
      MAPPING[hue_change][light_change].new
    end
  end
end
