alias RGBA = StumpyCore::RGBA

module PietInterpreter
  enum Hue
    Red
    Yellow
    Green
    Cyan
    Blue
    Magenta
  end

  enum Lightness
    Light
    Normal
    Dark
  end

  enum Grey
    White
    Black
  end

  alias Tint = Tuple(Lightness, Hue)

  alias Colour = Tint | Grey

  def lighten(l : Lightness)
    case l
    when Light
      Dark
    when Dark
      Normal
    when Normal
      Light
    end
  end

  def lighten(tint : Tint)
    lightness, hue = tint

    {lighten(lightness), hue}
  end

  def darken(l : Lightness)
    case l
    when Light
      Normal
    when Normal
      Dark
    when Dark
      Light
    end
  end

  def darken(tint : Tint)
    lightness, hue = tint

    {darken(lightness), hue}
  end

  def to_colour(rgba : RGBA) : Colour
    case rgba
    when RGBA::White
      Gray::White
    when RGBA::Black
      Gray::Black
    else
      Gray::Black
    end
  end
end
