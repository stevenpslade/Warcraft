require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "starts off with 500 health points" do
    expect(@barracks.health_points).to eq(500)
  end

end

describe Footman do

  before :each do
    @footman = Footman.new
  end

describe "#attack!"
  it "should deal half their set AP when against barracks" do
    enemy = Barracks.new
    expect(enemy).to receive(:damage).with(5)
    @footman.attack!(enemy)
  end

  it "should deal normal AP against enemies that are no Barracks" do
    enemy = Footman.new
    expect(enemy).to receive(:damage).with(10)
    @footman.attack!(enemy)
  end
end