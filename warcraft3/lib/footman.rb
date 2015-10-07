# http://classic.battle.net/war3/human/units/footman.shtml
require_relative 'unit'
require 'pry'

class Footman < Unit

  def initialize
    @health_points = 60
    @attack_power = 10
  end

  def attack!(enemy)
    if enemy.is_a?(Barracks)
      enemy.damage(@attack_power / 2)
    else
      super
    end
  end

  def damage(points)
    @health_points -= points
  end

end
