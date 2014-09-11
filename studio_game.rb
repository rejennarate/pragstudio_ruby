require_relative 'player'
require_relative 'game'

player1 = Player.new "whaley"
player2 = Player.new "catly", 60
player3 = Player.new "bro", 125

buttfaces = Game.new "buttfaces"
buttfaces.add_player player1
buttfaces.add_player player2
buttfaces.add_player player3
buttfaces.play(3)
buttfaces.print_stats



# is intialize method required for classes?