class Calculator

  def initialize number1, number2
    @number1 = number1
    @number2 = number2
  end

  def add
    puts @number1 + @number2
  end

  def subtract
    puts @number1 - @number2
  end

end

calc = Calculator.new 20, 11
puts calc.add
puts calc.subtract