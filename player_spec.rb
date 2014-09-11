require_relative 'player'

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
    expect(@player.to_s).to eq "#{@player.name} has a health of #{@player.health} and a score of #{@player.score}."
  end

  it "computes a score as the sum of its health and length of name" do
    expect(@player.score).to eq @initial_health + 6
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
end
