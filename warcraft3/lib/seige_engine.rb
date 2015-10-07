require_relative 'unit'
require 'pry'

class SeigeEngine < Unit

  attr_accessor :health_points, :attack_power

  def initialize
    @health_points = 400
    @attack_power = 50
  end

  def attack!(enemy)
    if enemy.is_a?(Barracks)
      enemy.damage(@attack_power * 2)
    elsif enemy.is_a?(SeigeEngine)
      super
    end
  end

end