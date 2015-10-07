require_relative 'spec_helper'

describe Unit do

  before :each do
    @unit = Unit.new(30, 20)
  end

  describe "#dead?" do
    it "returns false if HP is above 0" do
      expect(@unit.dead?).to be_falsey
    end

    it "returns true if HP is below or equal to 0" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to be_truthy
    end

  end

end