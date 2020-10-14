require 'active_support'
require 'active_support/core_ext'
def StringChallenge(str)
  #p "str #{str}"
  arr = str.split('.')
  #p "arr #{arr}"
  return 'false' if arr.size != 3
  #p "arr.size #{arr.size}"
  arr.each_with_index do |num_str, idx|
    #p "idx #{idx}"
    #p "num_str #{num_str}"
    
    
    num_arr = num_str.split('')
    #p "num_arr = num_str.split('') #{num_arr}"#[\"1\", \"2\", \"4\"]"

    return 'false' if num_arr.size != 3

    #The first set of digits must add up to an even number.
    #p "num_arr.map(&:to_i) #{num_arr.map(&:to_i).split('')}"
    #p "if idx == 0 && (num_arr.map(&:to_i).sum % 2) != 0 #{(num_arr.map(&:to_i).sum % 2) != 0}"
    return 'false' if idx == 0 && (num_arr.map(&:to_i).sum % 2) != 0
    
    #The second set of digits must add up to an odd number
    #p "if idx == 0 && (num_arr.map(&:to_i).sum % 2) != 0 #{(num_arr.map(&:to_i).sum % 2) == 0}"
    return 'false' if idx == 1 && (num_arr.map(&:to_i).sum % 2) == 0

    #The last digit in each set must be larger than the two previous digits in the same set.
    #p "num_arr[-1].to_i #{num_arr[-1].to_i}"
    #p "num_arr[0].to_i #{num_arr[0].to_i}"
    #p "num_arr[1].to_i #{num_arr[1].to_i}"
    return 'false' if num_arr[-1].to_i <= num_arr[0].to_i || num_arr[-1].to_i <= num_arr[1].to_i

    p "num_arr:_ #{num_arr}"
    num_arr.each do |num|
      p "num.to_i.in?([1,2]): #{num.to_i.in?([1,2])}"
      p "num.to_i.in?([1,2]): #{num.to_i.in?([1,2])}"
      return 'false' unless num.to_i.in?([1,2,3,4,5,6,7,8,9])
    end

  end
  return '~~~true~~~'
end
num_arr = 
num.to_i.in?([1,2])
a = "112.124.567."
p a
p StringChallenge (a)
str2 = "112"
p pc = str2.split('') #["1", "1", "2"]

=begin
String Challenge
Have the function StringChallenge(str) take the str parameter being passed 
and determine if it is a valid serial number with the following constraints:

1. It needs to contain three sets each with three digits (1 through 9) separated by a period.
2. The first set of digits must add up to an even number.
3. The second set of digits must add up to an odd number.
4. The last digit in each set must be larger than the two previous digits in the same set.

If all the above constraints are met within the string, the your program should return the string true,
 otherwise your program should return the string false. For example: if str is "224.315.218"
  then your program should return "true".

Examples
Input: "11.124.667"
Output: false
Input: "114.568.112"
Output: true

=begin
arr2 = ["qwe","asd"]
arr2.each_with_index do |num_str, idx|
  p "num_str #{num_str}"
    p "idx #{idx}"
  end  
=begin
str1 = "Wolf 359"
p /\d/.match(str1) # Соответствует "Wolf" (то же, что /[a-zA-Z_0-9]+/)
/\w+ \d+/.match(str1) # Соответствует "Wolf 359"
/\w+ \w+/.match(str1) # Соответствует "Wolf 359"
/\s+/.match(str1) # Соответствует " "
=begin
str = "Когда-то\nдавным-давно...\nКонец\n"
num = 0
str.each_char do |line|
num += 1
print "Строка #{num}: #{line}"
end
=begin
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