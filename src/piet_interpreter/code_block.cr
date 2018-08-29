module PietInterpreter
  struct Point2D
    getter x : UInt16
    getter y : UInt16

    def initialize(@x, @y)
    end

    def right
      Point2D.new(x: x + 1, y: y)
    end

    def left
      new_x = (x == 0 ? 0 : (x - 1)).to_u16
      Point2D.new(x: new_x, y: y)
    end

    def down
      Point2D.new(x: x, y: y + 1)
    end

    def up
      new_y = (y == 0 ? 0 : (y - 1)).to_u16
      Point2D.new(x: x, y: new_y)
    end

    def neighbours
      [right, left, up, down]
    end
  end

  struct CodeBlock
    getter colour : Colour
    getter size : UInt64

    def initialize(@colour, @size)
      raise ArgumentError.new("codel size must be greater than 0") unless size > 0

      @size = size
    end

    def self.from_location(x, y, reader)
      point = Point2D.new(x.to_u16, y.to_u16)

      colour = Colours.to_colour(reader.get(x, y))

      checked_codels = Set(Point2D).new
      rejected_codels = Set(Point2D).new
      checking_queue = Deque(Point2D).new

      checking_queue.unshift(point)

      while checking_queue.any?
        this_point = checking_queue.pop

        if checked_codels.includes?(this_point) || rejected_codels.includes?(this_point)
          next
        end

        this_colour = begin
          Colours.to_colour(reader.get(this_point.x, this_point.y))
        rescue IndexError # not a valid pixel location
          next
        end

        if this_colour == colour
          checked_codels.add(this_point)
        else
          rejected_codels.add(this_point)
          next
        end

        this_point.neighbours.each { |p| checking_queue.unshift(p) }
      end

      codels = checked_codels.size.to_u64
      new(colour: colour, size: codels)
    end
  end
end
