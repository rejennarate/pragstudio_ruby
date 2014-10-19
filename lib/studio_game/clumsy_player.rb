require_relative 'player'

module StudioGame
  class ClumsyPlayer < Player

    def found_treasure treasure
      damaged_treasure = Treasure.new(treasure.name, treasure.points / 2.0)
      super damaged_treasure
    end

    if __FILE__ == $0
      clumsy = ClumsyPlayer.new("klutz")

      triforks = Treasure.new(:triforks, 50)
      clumsy.found_treasure(triforks)
      clumsy.found_treasure(triforks)
      clumsy.found_treasure(triforks)

      tango = Treasure.new(:tango, 400)
      clumsy.found_treasure(tango)

      clumsy.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end

      puts "#{clumsy.points} grand total points"
    end
  end
end