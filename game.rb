require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

class Game
  attr_reader :title

  def initialize title
    @title = title
    @players = []
  end

  def add_player new_player
    @players <<  new_player
  end

  def play rounds
    puts "There are #{@players.size} players in #{title}:"
    @players.each do |player|
      puts player
    end
   
   1.upto rounds do |round|
      puts "Round #{round}"
      @players.each do |player|
        GameTurn.take_turn player
        puts player
      end
    end
  end

  def print_stats
    puts "#{@players}"
    strong_players, wimpy_players = @players.partition { |player| player.strong? }
    puts "\n#{@title} statistics:"
    puts "\n#{strong_players.length} strong players:"
    strong_players.each { |player| puts "#{player.name} (#{player.health})" }
    puts "\n#{wimpy_players.length} wimpy players:"
    wimpy_players.each { |player| puts "#{player.name} (#{player.health})"}
    sorted_players = @players.sort { |a, b| b.score <=> a.score }
  end
end