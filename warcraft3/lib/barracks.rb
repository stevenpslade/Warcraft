require_relative 'footman'
require_relative 'peasant'
require_relative 'seige_engine'

class Barracks

  attr_accessor :gold, :food, :health_points, :lumber

  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500
  end

  def damage(points)
    if !(dead?)
      @health_points -= points
    else
      return "Already dead."
    end
  end

  def dead?
    health_points <= 0
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      footman = Footman.new
    end
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      peasant = Peasant.new
    end
  end

   def train_seige_engine
    if can_train_seige_engine?
      @gold -= 200
      @food -= 3
      @lumber -= 60
      seige_engine = SeigeEngine.new
    end
  end

   def can_train_seige_engine?
    if (food >= 3 && gold >= 200 && lumber >= 60)
      true
    else
      false
    end
  end

  def can_train_peasant?
    if (food >= 5 && gold >= 90)
      true
    else
      false
    end
  end

  def can_train_footman?
    if (food >= 2 && gold >= 135)
      true
    else
      false
    end
  end

end
