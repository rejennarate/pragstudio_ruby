require 'studio_game/game'

module StudioGame
  describe Game do

    before do
      $stdout = StringIO.new
      @game = Game.new("buttfaces")
      @initial_health = 100
      @player = Player.new "whaley", @initial_health
      @game.add_player(@player)
    end

    it "meks a player if a high number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(5)
      @game.play(2)
      expect(@player.health).to eq @initial_health + (15 * 2)
    end

    it "skips a player if a medium number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(3)
      @game.play(2)
      expect(@player.health).to eq @initial_health
    end

    it "reks a player if a low number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(1)
      @game.play(2)
      expect(@player.health).to eq @initial_health - (10 * 2)
    end

    it "assigns a treasure for points during a player's turn" do
      game = Game.new("buttfaces")
      player = Player.new("bro")

      game.add_player(player)

      game.play(1)

      expect(player.points).not_to be_zero
    end
  end
end