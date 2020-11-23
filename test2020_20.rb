p " run: #{}"

def reverse_sign(an_integer)
  return 0 - an_integer
end

p reverse_sign(0+1-1)
p reverse_sign(-5)

p " Could you replace all the characters in capital case with number '0' in the following problem? 
run: #{'RubyMonk Is Pretty Brilliant'.gsub(/[A-Z]/,'0')}"
puts "I should".gsub('I','We')
puts "'Ruby'.concat('Padavan') run: #{
'Ruby'.concat('Padavan')
}"
puts "'Fear is the path to the dark side'.split('') run: #{
'Fear is the path to the dark side'.split('')
}"
def string_length_interpolater(incoming_string)
  "The string you just gave me has a length of #{incoming_string.length}"
end
 puts string_length_interpolater("asd")
def stringin2
  #return "[Luke:] I can’t believe it. [Yoda:] That is why you fail.".include? 'Yoda'
  #return "Ruby is a beautiful language Ruby".start_with? "Ruby"
  return "Ruby is a beautiful language ".end_with? "Ruby"
end
puts ".include? 'Yoda' .start_with? Ruby .end_with? run: #{ stringin2 }"
puts "4.+(3) run: #{4.+(3)}" # 0_o ого!





puts "2.between? -1,3 run: #{2.between? 3,-1}"
puts 2.between? 2,3
puts ['rock','paper','scissors'].index('paper')
puts "{['rock','paper','scissors'].index('rock')} run: #{['rock','paper','scissors'].index('rock')}"




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
=begin
puts 1.methods+
=end