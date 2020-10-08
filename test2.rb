
def StringChallenge(str)
  split_by_dot_str = str.split('.')
  split_by_ch_str = str.split("")
  array = []
  split_by_ch_str.each do |string|
    
    split_by_ch_str = string.split("")
    p "split_by_ch_str = string.split("" #{split_by_ch_str}"

    split_by_ch_str.each do |ch|
      if ch == "." && (array[-1].to_i+array[-2].to_i+array[-3].to_i) % 2 == 0
      p "array +=(-1-2-3)  #{array[].sum}"  
      p "array +=(-1-2-3)  #{array[-1].to_i+array[-2].to_i+array[-3].to_i}"
      p "array +=(-1-2-3) % 2 == #{array[-1].to_i+array[-2].to_i+array[-3].to_i % 2 }"
      p "array +=(-1-2-3) % 2 == #{array[-1].to_i+array[-2].to_i+array[-3].to_i % 2 }"
      p "(array[-1].to_i+array[-2].to_i+array[-3].to_i) % 2 == 0: #{(array[-1].to_i+array[-2].to_i+array[-3].to_i) % 2 == 0}"

      p "ch[-1] #{ch[-1]}"
      p "ch in if == (.) #{ch}"
      return true
      else 
        array << ch
      p "array is #{array}"
      end  
    end  
    'true'
  end  
end
a = "211.315.218"
p StringChallenge(a)
=begin      
      if ch == "." && array[-1].to_i+array[-2].to_i+array[-3].to_i % 2 == 2
      p "array +=(-1-2-3)  #{array[-1].to_i+array[-2].to_i+array[-3].to_i}"
      p "array +=(-1-2-3) % 2 == #{array[-1].to_i+array[-2].to_i+array[-3].to_i % 2 }"

      p "ch[-1] #{ch[-1]}"
      p "ch in if == (.) #{ch}"
      return true
      else 
        array << ch
      p "array is #{array}"
=end
#if string == "."
    #  p "string[-1] #{string[-1]}"
    #  p "string in if #{string}"
    #  return true
    #end  
=begin
# Вычисляем остаток от деления на два методом %,
# если остаток от деления равен нулю - число делится на 2
if a % 2 == 0
  puts 'Число четное'
else
  puts 'Число нечетное'
end
#остаток от деления на 2 # % 2

c_str = string.split()
    p "c_str = string.split() #{c_str}"


p a_str
  nums = [2,2,8]#[1,3,5,8]
  # Есть ли среди чисел четные?
  flag1 = nums.all? {|x| x % 2 == 0 }
  flag1 = nums.any? {|x| x % 2 == 0 } # true
  p "flag1 #{flag1}"
  flag2 = a_str.any? {|x| x % 2 == 0 } # true
  p "flag2 a_str #{flag2}"


    if str == "224.315.218" #"114.568.112" #"11.124.667"
      return true
    else
      return false
    end

1. three sets with three digits 1 through 9  separated by period
2. the first set of digits must add up to an even numder .  четное число a % 2 ==


=begin
def balance?(str)
  hash = {')' => '(', ']' => '[', '}' => '{'}
  stack = []
  str.each_char do |ch|
    case ch
    when "(", "[", "{" 
      stack << ch
    when ")", "]", "}"
      return false if stack.empty? || stack[-1] != hash[ch]
      stack.pop
    end  
  end
  true 
end
p b = "(adc(123[]{}))"
p unb = "([){]}"
p balance?(unb)
=begin
class Friend
 @@myname = "Эндрю" # переменная класса
 def initialize(name, sex, phone)
 @name, @sex, @phone = name, sex, phone
 # Это переменные экземпляра
 end
 def hello # метод экземпляра
 puts "Привет, я #{@name}.#{@sex} #{@phone}"
 end
 def hello_return_name
  return @name
 end
 def Friend.our_common_friend # метод класса
 puts "Все мы друзья #{@@myname} ."
 end
end
f1 = Friend.new("Сюзанна","F","555-0123")
f2 = Friend.new("Том","M","555-4567")
f1.hello # Привет, я Сюзанна.
f2.hello # Привет, я Том.
p f1.hello_return_name
=end