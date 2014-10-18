require_relative 'auditable'

class Die
  include Auditable
  attr_accessor :number

  def initialize
    roll
  end

  def roll
    @number = rand(1..6)
    audit
    @number
  end
end