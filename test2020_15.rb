a = 5
b = 6
puts a + b

addition = lambda {|a, b| return a + b }
puts addition.call(5, 6)

empty_block = lambda { }
puts empty_block.object_id
puts empty_block.class
puts empty_block.class.superclass

class Calculator
  def add(a, b)
    return a + b
  end
end

puts Calculator.new.add(5, 6)