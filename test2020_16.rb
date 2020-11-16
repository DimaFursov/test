puts " run: #{}"
puts "2.between? -1,3 run: #{2.between? 3,-1}"
puts 2.between? 2,3
puts ['rock','paper','scissors'].index('paper')
puts "{['rock','paper','scissors'].index('rock')} run: #{['rock','paper','scissors'].index('rock')}"



=begin

puts 1.methods
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

puts 2.even?
=end