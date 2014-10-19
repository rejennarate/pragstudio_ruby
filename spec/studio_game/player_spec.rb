require 'studio_game/player'
require 'studio_game/treasure_trove'

module StudioGame
  describe Player do

    before do
      $stdout = StringIO.new
      @initial_health = 150
      @player = Player.new "whaley", @initial_health
    end

    it "has a capitalized name" do
      expect(@player.name).to eq "Whaley"
    end  

    it "has an initial health" do
      expect(@player.health).to eq 150
    end

    it "has a string representation" do
      expect(@player.to_s).to eq "#{@player.name} has a health of #{@player.health}, #{@player.points} points, and a score of #{@player.score}."
    end

    it "computes a score as the sum of its health and points" do
      @player.found_treasure(Treasure.new(:triforks, 50))
      @player.found_treasure(Treasure.new(:triforks, 50))

      expect(@player.score).to eq 250  
    end

    it "increases health by 15 when mek'd" do
      @player.mek
      expect(@player.health).to eq @initial_health + 15
    end

    it "decreases health by 10 when rekt" do
      @player.rekt
      expect(@player.health).to eq @initial_health - 10
    end

    context "with an initial health of 150" do
      before do
        @player = Player.new "whaley", 150
      end

      it "is strong" do
        expect(@player.strong?).to be_truthy
      end
    end

    context "with an initial health of 100" do
      before do
        @player = Player.new "whaley", 100
      end

      it "is wimpy" do
        expect(@player.strong?).to be_falsey
      end
    end

    context "in a collection of players" do
      before do
        @player1 = "whaley", 100
        @player2 = "catly", 200
        @player3 = "bro", 300

        @players = [@player1, @player2, @player3]
      end

      it "is sorted in decreasing order" do
        expect(@players.sort).to eq [@player3, @player2, @player1]
      end
    end

    it "computes points as the sum of all treasure points" do
      expect(@player.points).to eq 0

      @player.found_treasure(Treasure.new(:triforks, 50))

      expect(@player.points).to eq 50

      @player.found_treasure(Treasure.new(:tango, 400))

      expect(@player.points).to eq 450

      @player.found_treasure(Treasure.new(:triforks, 50))

      expect(@player.points).to eq 500
    end

    it "yields each found treasure and its total points" do
      @player.found_treasure(Treasure.new(:tango, 400))
      @player.found_treasure(Treasure.new(:tango, 400))
      @player.found_treasure(Treasure.new(:triforks, 50))
      @player.found_treasure(Treasure.new(:woon_stone, 25))
      @player.found_treasure(Treasure.new(:woon_stone, 25))
      @player.found_treasure(Treasure.new(:woon_stone, 25))
      @player.found_treasure(Treasure.new(:woon_stone, 25))

      yielded = []
      @player.each_found_treasure do |treasure|
        yielded << treasure
      end

      expect(yielded).to eq [
        Treasure.new(:tango, 800),
        Treasure.new(:triforks, 50),
        Treasure.new(:woon_stone, 100)
      ]
    end

  end
end