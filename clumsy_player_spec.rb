require_relative 'clumsy_player'

describe ClumsyPlayer do 
  before do
    @player = ClumsyPlayer.new("klutz")
  end

  it "only gets half the point value for each treasure" do 
    expect(@player.points).to eq 0

    triforks = Treasure.new(:triforks, 50)
    @player.found_treasure(triforks)
    @player.found_treasure(triforks)
    @player.found_treasure(triforks)

    expect(@player.points).to eq 75

    tango = Treasure.new(:tango, 400)
    @player.found_treasure(tango)

    expect(@player.points).to eq 275

    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end

    expect(yielded).to eq [Treasure.new(:triforks, 75), Treasure.new(:tango, 200)]
  end

end