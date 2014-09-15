Treasure = Struct.new :name, :points

module TreasureTrove
  TREASURES = [
    Treasure.new(:tiny_hamburger, 5),
    Treasure.new(:sheepstick, 25),
    Treasure.new(:triforks, 50),
    Treasure.new(:blonk_digger, 100),
    Treasure.new(:bacon, 200),
    Treasure.new(:tango, 400),
    ]

  def self.random
    TREASURES.sample
  end
  
end
