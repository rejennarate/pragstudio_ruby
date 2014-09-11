class Player
  attr_accessor :name
  attr_reader :health

  def initialize name, health=100
    @name = name.capitalize
    @health = health
  end

  def <=> other
    other.score <=> score
  end

  def to_s
    "#{@name} has a health of #{@health} and a score of #{score}."
  end

  def rekt
    @health -= 10
    puts "#{@name} got rekt!"
  end

  def mek
    @health += 15
    puts "#{@name} got mek'd!"
  end

  def score
    @health + @name.length
  end

  def strong?
    if @health > 100
      true
    elsif @health <= 100
      false
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