require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#can_train_seige_engine?" do
    it "returns true if there are enough resources to train a seige engine" do
      expect(@barracks.can_train_seige_engine?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_train_seige_engine?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      expect(@barracks).to receive(:gold).and_return(199)
      expect(@barracks.can_train_seige_engine?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      expect(@barracks).to receive(:lumber).and_return(59)
      expect(@barracks.can_train_seige_engine?).to be_falsey
    end
  end

  describe "#train_seige_engine" do
    it "does not train a seige engine if there aren't enough resources" do
      expect(@barracks).to receive(:can_train_seige_engine?).and_return(false)
      expect(@barracks.train_seige_engine).to be_nil
    end

    it "trains a seige engine if there are enough resources" do
      expect(@barracks).to receive(:can_train_seige_engine?).and_return(true)
      expect(@barracks.train_seige_engine).to be_a(SeigeEngine)
    end
  end

end

describe SeigeEngine do

  before :each do
    @seige_engine = SeigeEngine.new
  end

  it "starts off with 400 health points" do
    expect(@seige_engine.health_points).to eq(400)
  end

  it "starts off with 50 attack power" do
    expect(@seige_engine.attack_power).to eq(50)
  end

  describe "#attack!" do
    it "should deal double their set AP when against barracks" do
      enemy = Barracks.new
      # expect(enemy).to receive(:damage).twice.with(100)
      @seige_engine.attack!(enemy)
      expect(enemy.health_points).to eq(400)
    end

    it "should deal 0 damage against other units (that are not seige units)" do
      enemy = Footman.new
      # expect(enemy).to receive(:damage).twice.with(0)
      @seige_engine.attack!(enemy)
      expect(enemy.health_points).to eq(60)
    end

    it "should deal normal attack power against other seige units" do
      enemy = SeigeEngine.new
      # expect(enemy).to receive(:damage).twice.with(50)
      @seige_engine.attack!(enemy)
      expect(enemy.health_points).to eq(350)
    end
  end

end








