require 'studio_game/treasure_trove'

module StudioGame
  describe Treasure do 

    before do 
      @treasure = Treasure.new(:triforks, 50)
    end

    it "has a name attribute" do 
      expect(@treasure.name).to eq :triforks
    end

    it "has a points attribute" do 
      expect(@treasure.points).to eq 50
    end

  end

  describe TreasureTrove do 

    it "has six treasures" do 
      expect(TreasureTrove::TREASURES.size).to eq 6
    end

    it "has a tiny_hamburger worth 5 points" do
      expect(TreasureTrove::TREASURES[0]).to eq Treasure.new(:tiny_hamburger, 5)
    end

    it "has a woon_stone worth 25 points" do 
      expect(TreasureTrove::TREASURES[1]).to eq Treasure.new(:woon_stone, 25)
    end

    it "has a triforks worth 50 points" do 
      expect(TreasureTrove::TREASURES[2]).to eq Treasure.new(:triforks, 50)
    end

    it "has a blonk_digger worth 100 points" do 
      expect(TreasureTrove::TREASURES[3]).to eq Treasure.new(:blonk_digger, 100)
    end

    it "has a bacon worth 200 points" do
      expect(TreasureTrove::TREASURES[4]).to eq Treasure.new(:bacon, 200)
    end

    it "has a tango worth 400 points" do
      expect(TreasureTrove::TREASURES[5]).to eq Treasure.new(:tango, 400)
    end

    it "returns a random treasure" do 
      treasure = TreasureTrove.random

      expect(TreasureTrove::TREASURES).to include(treasure)
    end

  end
end






