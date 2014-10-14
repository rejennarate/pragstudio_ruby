require_relative 'player'
require_relative 'game'
require_relative 'clumsy_player'
require_relative 'berserk_player'

buttfaces = Game.new "buttfaces"
buttfaces.load_players(ARGV.shift || "players.csv")
klutz = ClumsyPlayer.new("klutz", 105)
buttfaces.add_player klutz
berserker = BerserkPlayer.new("berserker", 50)
buttfaces.add_player berserker

loop do
  puts "How many game rounds? ('quit' to exit)"
  game_rounds = gets.chomp.downcase
  case game_rounds
  when /^\d+$/
    buttfaces.play(game_rounds.to_i)
  when "quit", "exit"
    buttfaces.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

buttfaces.save_high_scores

# is intialize method required for classes?