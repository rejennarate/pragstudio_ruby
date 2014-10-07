require_relative 'player'
require_relative 'game'

buttfaces = Game.new "buttfaces"
buttfaces.load_players(ARGV.shift || "players.csv")

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