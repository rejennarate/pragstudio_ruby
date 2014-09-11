module GameTurn

  def self.take_turn player
    die = Die.new
    case die.roll
    when (5..6)
      player.mek
      puts player
    when (3..4)
      puts "#{player.name} was skipped."
      puts player
    when (1..2)
      player.rekt
      puts player
    end
  end

end
