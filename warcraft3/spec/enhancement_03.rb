require_relative 'spec_helper'

describe Unit do

  before :each do
    @unit = Unit.new(30, 10)
  end

  describe "#attack!" do
    it "should attack (deal damage) when unit is alive" do
      enemy = Unit.new(30, 10)
      @unit.attack!(enemy)
      expect(enemy.health_points).to eq(20)
    end

    it "should not attack (deal damage) when unit is dead" do
      enemy = Unit.new(0, 10)
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.attack!(enemy)).to eq("You can't kill what's already dead!")
    end
  end

  describe "#damage" do
    it "should receive damage when not dead" do
      @unit.damage(4)
      expect(@unit.health_points).to eq(26)
    end

    it "should not receive damage when dead" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.damage(4)).to eq("Already dead.")
    end
  end
end