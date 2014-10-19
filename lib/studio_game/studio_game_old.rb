player1 = "whaley"
player2 = "catly"
player3 = "bro"
player4 = "butt ers"
player1_health = 60
player2_health = player1_health
player3_health = 100
player4_health = 90

puts "#{player1.capitalize}'s health is #{player1_health}"
puts "#{player2.upcase}'s health is #{player2_health}"
puts "#{player3.capitalize}'s health is #{player3_health}".center(30, '*')
puts "#{player4.capitalize.ljust(30,'.')} #{player4_health} health"

puts "The game started on #{Time.new.strftime("%A %m/%d/%Y at %I:%M%P")}"

