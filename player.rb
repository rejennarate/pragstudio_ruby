require_relative 'treasure_trove'
require_relative 'playable'

class Player
  include Playable 
  attr_accessor :name
  attr_reader :health

  def initialize name, health=100
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new 0
  end

  def <=> other
    other.score <=> score
  end

  def to_s
    "#{@name} has a health of #{@health}, #{points} points, and a score of #{score}."
  end

  def score
    @health + points
  end

  def found_treasure treasure
    @found_treasures[treasure.name] += treasure.points 
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s treasures: #{@found_treasures}"
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end

  def each_found_treasure
    @found_treasures.each do |name, points|
      yield Treasure.new(name, points)
    end
  end

end

if __FILE__ == $0 # this line runs the code only if current file is player.rb (aka $0)
  player = Player.new "whaley"
  puts player.name
  puts player.health
  player.mek
  puts player.health
  player.rekt
  puts player.health
end