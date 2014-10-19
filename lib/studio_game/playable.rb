module Playable
def rekt
    @health -= 10
    puts "#{@name} got rekt!"
  end

  def mek
    @health += 15
    puts "#{@name} got mek'd!"
  end

  def strong?
    if @health > 100
      true
    elsif @health <= 100
      false
    end
  end
end