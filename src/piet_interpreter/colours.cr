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

  module Colours
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

    def self.to_colour(rgba : RGBA) : Colour
      case rgba
      when RGBA::WHITE
        Grey::White
      when RGBA::BLACK
        Grey::Black
      when RGBA::RED
        {Lightness::Normal, Hue::Red}
      when RGBA::BLUE
        {Lightness::Normal, Hue::Blue}
      when RGBA::GREEN
        {Lightness::Normal, Hue::Green}
      when RGBA::CYAN
        {Lightness::Normal, Hue::Cyan}
      when RGBA::MAGENTA
        {Lightness::Normal, Hue::Magenta}
      when RGBA.from_hex("#FFC0C0")
        {Lightness::Light, Hue::Red}
      when RGBA.from_hex("#FFFFC0")
        {Lightness::Light, Hue::Yellow}
      when RGBA.from_hex("#C0FFC0")
        {Lightness::Light, Hue::Green}
      when RGBA.from_hex("#C0FFFF")
        {Lightness::Light, Hue::Cyan}
      when RGBA.from_hex("#C0C0FF")
        {Lightness::Light, Hue::Blue}
      when RGBA.from_hex("#FFC0FF")
        {Lightness::Light, Hue::Magenta}
      when RGBA.from_hex("#C00000")
        {Lightness::Dark, Hue::Red}
      when RGBA.from_hex("#C0C000")
        {Lightness::Dark, Hue::Yellow}
      when RGBA.from_hex("#00C000")
        {Lightness::Dark, Hue::Green}
      when RGBA.from_hex("#00C0C0")
        {Lightness::Dark, Hue::Cyan}
      when RGBA.from_hex("#0000C0")
        {Lightness::Dark, Hue::Blue}
      when RGBA.from_hex("#C000C0")
        {Lightness::Dark, Hue::Magenta}
      else
        Grey::Black
      end
    end
  end
end
