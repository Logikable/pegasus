module ApplicationHelper

  def get_level(xp)
    if xp < 50
      return "Newbie"
    elsif xp < 100
      return "Novice"
    elsif xp < 180
      return "Reliable"
    elsif xp < 290
      return "Accomplished"
    elsif xp < 430
      return "Exemplary"
    elsif xp < 600
      return "Legendary"
    else 
      return "Master"
    end
  end

  def get_percentage(xp)
    if xp < 50
      return xp / 50.0 * 100.0
    elsif xp < 100
      return (xp - 50) / 50.0 * 100.0
    elsif xp < 180
      return (xp - 100) / 80.0 * 100.0
    elsif xp < 290
      return (xp - 180) / 110.0 * 100.0
    elsif xp < 430
      return (xp - 290) / 140.0 * 100.0
    elsif xp < 600
      return (xp - 430) / 170.0 * 100.0
    else 
      return 100
    end
  end

  def next_level(xp)
    if xp < 50
      return "Novice"
    elsif xp < 100
      return "Reliable"
    elsif xp < 180
      return "Accomplished"
    elsif xp < 290
      return "Exemplary"
    elsif xp < 430
      return "Legendary"
    elsif xp < 600
      return "Master"
    else 
      return ""
    end
  end

end
