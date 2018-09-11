module PietInterpreter
  enum Direction
    Right = 0
    Down = 1
    Left = 2
    Up = 3

    def toggle(steps : Int64) : self
      normalised_steps = steps % 4

      Direction.from_value((self.to_i8 + steps) % 4)
    end
  end

  enum CodelChooserDirection
    Left
    Right
  end
end
