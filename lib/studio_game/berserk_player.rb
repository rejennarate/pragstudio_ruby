require_relative 'player'

module StudioGame
  class BerserkPlayer < Player

    def initialize name, health=100
      super name, health
      @mek_count = 0
    end

    def berserk?
      @mek_count > 5
    end

    def mek
      super
      @mek_count += 1
      puts "#{@name} is berserk!" if berserk?
    end

    def rekt
      if berserk?
        mek 
      else
        super
      end
    end

    if __FILE__ == $0
      berserker = BerserkPlayer.new("berserker", 50)
      berserker.rekt
      puts berserker.health
      6.times {berserker.mek}
      puts berserker.health
      berserker.rekt
      puts berserker.health
    end

  end
end