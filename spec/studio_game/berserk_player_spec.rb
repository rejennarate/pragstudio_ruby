require 'studio_game/berserk_player'

module StudioGame
  describe BerserkPlayer do 

    before do 
      @initial_health = 50
      @player = BerserkPlayer.new("berserker", @initial_health)
    end

    it "does not go berserk when mek'd up to 5 times" do
      1.upto(5) {@player.mek} 

      expect(@player.berserk?).to be_falsey
    end

    it "goes berserk when mek'd more than 5 times" do 
      1.upto(6) {@player.mek}

      expect(@player.berserk?).to be_truthy
    end

    it "gets mek'd instead of rekt when it's gone berserk" do
      1.upto(6) {@player.mek}
      1.upto(2) {@player.rekt}

      expect(@player.health).to eq @initial_health + (8 * 15)
    end

  end
end