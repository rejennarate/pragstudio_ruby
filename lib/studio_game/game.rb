require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

module StudioGame
  class Game
    attr_reader :title

    def initialize title
      @title = title
      @players = []
    end

    def load_players from_file
      File.readlines(from_file).each do |line|
        name, health = line.split(",")
        player = Player.new name, Integer(health)
        add_player player
      end
    end

    def save_high_scores to_file="high_scores.txt"
      File.open to_file, "w" do |file|
        file.puts "#{@title} high scores:"
         @players.sort.each do |player|
          file.puts high_score_entry(player)
        end
      end
    end

    def add_player new_player
      @players <<  new_player
    end

    def play rounds
      puts "There are #{@players.size} players in #{title}:"
      @players.each do |player|
        puts player
      end
     
      treasures = TreasureTrove::TREASURES
      puts "There are #{treasures.size} treasures:"
      treasures.each do |treasure|
        puts "#{treasure.name} is worth #{treasure.points} points"
      end

     1.upto rounds do |round|
        puts "Round #{round}"
        @players.each do |player|
          GameTurn.take_turn player
          puts player
        end
      end
    end

    def print_name_and_health player
      puts "#{player.name} (#{player.health})"
    end

    def print_stats
      strong_players, wimpy_players = @players.partition { |player| player.strong? }
      puts "\n#{@title} statistics:"

      puts "\n#{strong_players.length} strong players:"
      strong_players.each { |player| print_name_and_health player }

      puts "\n#{wimpy_players.length} wimpy players:"
      wimpy_players.each { |player| print_name_and_health player }

      puts @players.sort 

      @players.each do |player|
        puts "\n#{player.name}'s points:"
        player.each_found_treasure do |treasure|
          puts "#{treasure.points} #{treasure.name} points"
        end
        puts "#{player.points} total points"
      end

      #formatting
      puts "\n#{@title} high scores:"
      @players.sort.each do |player|
        puts high_score_entry(player)
      end
    end

    def high_score_entry player
      formatted_name = player.name.ljust(20, '.')
      "#{formatted_name} #{player.score}"
    end
  end
end