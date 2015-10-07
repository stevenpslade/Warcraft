
class Unit

  attr_accessor :health_points, :attack_power

  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def damage(points)
    if !(dead?)
      @health_points -= points
    else
      return "Already dead."
    end
  end

   def attack!(enemy)
    if !(dead?)
      enemy.damage(@attack_power)
    else
      return "You can't kill what's already dead!"
    end
  end

  def dead?
    health_points <= 0
  end

end