require 'active_support'
require 'active_support/core_ext'
def serial(str)
  arr = str.split('.')
  return 'false' if arr.size !=3
  arr.each_with_index do |num_str, idx|
    num_arr = num_str.split('')
    return 'false' if num_arr.size !=3
    return 'false' if idx == 0 && (num_arr.map(&:to_i).sum % 2 ) != 0
    return 'false' if idx == 1 && (num_arr.map(&:to_i).sum % 2 ) == 0
    return 'false' if num_arr[-1].to_i <= num_arr[0].to_i || num_arr[-1].to_i <= num_arr[1].to_i
    num_arr.each do |num|
      return 'false' unless
      num.to_i.in?([1,2,3,4,5,6,7,8,9])
    end
  end  
  return 'true'
end  
p a = "112.124.667"
p serial(a)
=begin
def FirstReverse(str)
  i = 0
  j = str.size - 1

  while i < j
   str[i], str[j] = str[j], str[i]
   i += 1
   j -= 1
  end
  return str
end
   
# keep this function call here    
puts FirstReverse(STDIN.gets)

=begin
def FindIntersection(strArr)

  arr1 = str_to_arr(strArr[0])

  arr2 = str_to_arr(strArr[1])

  strArr = (arr1 & arr2).join(',')

  # code goes here
  return strArr
end

def str_to_arr(str)
  str.split(',').map {|num| num.to_i}
end

# keep this function call here 
puts FindIntersection(STDIN.gets)
=begin
def two_sum(arr, sum)
  hash_table = {}
  sums = []
  arr.each do |n|
    k = sum - n
    if hash_table.key?(k)
      sums.push([k, n])
    end
    hash_table[n] = true
  end
  sums
end
=begin
def twoSum(arr, s):
    for num in arr:
        dif = s - num
        try:
            if arr.index(dif):
                arr.remove(dif)
                arr.remove(num)
                yield num, dif
        except ValueError:
            pass


arr = [3, 5, 2, -4, 8, 1,11]
for num1, num2 in twoSum(arr, 4):
    print(num1, num2)
end    
=begin
#return false if condition Stack.pop
def balance?(str)
  hash = {')' => '(', ']' => '[', '}' => '{'}
  stack = []
  str.each_char do |ch|
    case ch
    when "(", "[", "{" 
      stack << ch
    when ")", "]", "}"
      #return false if stack.empty? || stack[-1] =! hash[ch]
      #stack.pop
      return false if stack.empty?
      if stack[-1] == hash[ch] then stack.pop else return false end
    end  
  end
  true 
end
p b = "(adc(123[]{}))"
unb = "]asd(123))"
p balance?(b)
p "______________new_________________________________"

p a = "[([){[]}]"
def balance?(str)
  hash = {')' => '(', ']' => '[', '}' => '{'}
  p x = "hash[')'] - #{hash[')']}"
  stack = []
  str.each_char do |ch|
    case ch
    when "(", "[", "{" 
      stack << ch
    when ")", "]", "}"
      p "ch - #{ch}"
      p "stack[-1] - #{stack[-1]}"
      p hash
      return false if stack.empty?
      if stack[-1] == hash[ch] then stack.pop else return false end
    end  
  end
  true 
end
b = "(adc(123[]{}))"
unb = "]asd(123))"
p balance?(a)

p "______________1_________________________________"
#a = ")(([][{[]}]))"
#p a = "())(()"
p a = "[([){[]}]"#"(()())"#"({)}"
def balance_p?(str)
  stack = []
  str.each_char do |ch|
    case ch
    when "("
      p "(" 
      stack << ch
      p stack
    when "["
      p "["
      stack << ch
      p stack
    when "{" 
      p "{:#{ch}"
      stack << ch
      p "{stack:"
      p stack
    when ")" 
      p ")"    
      p "array[-1] #{stack[-1]}"
      return false if stack.empty?
      if stack[-1] === "(" then stack.pop else return false end
      #return false if stack[-1] != "("
      p "end ) #{stack}"
    when "]"
      p "]"
      p "array[-1] #{stack[-1]}"
      #return false if stack.empty?
      
      return false if stack.empty? || stack[-1] != hash[ch]
      if stack[-1] === "[" then stack.pop else return false end
    when "}"
      p "}:"
      p ch
      p "array[-1] #{stack[-1]}"
      p stack[-1]
      #return false if stack.empty?
      #stack.pop if stack[-1] === "{"
      if stack[-1] === "{" then stack.pop else return false end
    end  
    #p ch
  end
  true 
end
balance = "(adc(123[]{}))"
unbalance = "]asd(123))"
p balance_p?(a)
#p balance_p?(balance)
#split('')
p "________________________________________________"
#p a = "({)}"
p str = "({"
#str = "alpha,beta,gamma,,"
list2 = str.split("",1)
p list2
stack = ["(","{"]
p stack[-1]
p a = "({)}"
def balance_p?(str)
  stack = []
  str.each_char do |ch|
    case ch
    when "("
      stack << ch
    when ")"
      if stack[-1] === "("
      return false if stack.empty?
    stack.pop
    end  
    p ch
  end
  true 
end
p balance_p?(a)
end
p "______________0_________________________________"
p a = "[([){[]}]"
hash = {'(' => ')', '[' => ']', '{' => '}'}
def balance?(str)
  stack = []
  str.each_char do |ch|
    case ch
    when "(", "[", "{" 
      stack << ch
    when ")" 
      return false if stack.empty?
      if stack[-1] === "(" then stack.pop else return false end
    when "]"
      return false if stack.empty?
      if stack[-1] === "[" then stack.pop else return false end
    when "}"
      return false if stack.empty?
      if stack[-1] === "{" then stack.pop else return false end
    end  
  end
  true 
end
b = "(adc(123[]{}))"
unbalance = "]asd(123))"
p balance?(a)
# x = hash = {')' => '(', ']' => '[', '}' => '{'}
#p hash = {')' => '(', ']' => '[', '}' => '{'}

=begin
String Challenge
Have the function StringChallenge(str) take the str parameter being passed and determine if it passes as a valid password that follows the list of constraints:

1. It must have a capital letter.
2. It must contain at least one number.
3. It must contain a punctuation mark.
4. It cannot have the word "password" in the string.
5. It must be longer than 7 characters and shorter than 31 characters.

If all the above constraints are met within the string, the your program should return the string true, otherwise your program should return the string false. For example: if str is "apple!M7" then your program should return "true".
Examples
Input: "passWord123!!!!"
Output: false
Input: "turkey90AAA="
Output: true







hash = {'(' => ')', '[' => ']', '{' => '}'}
    when ")" 
      return false if stack.empty?
      if stack[-1] === "(" then stack.pop else return false end
    when "]"
      return false if stack.empty?
      if stack[-1] === "[" then stack.pop else return false end
    when "}"
      return false if stack.empty?
      if stack[-1] === "{" then stack.pop else return false end
=end  
=begin
p "________________________________________________"
count_clouse_circle = 0
count_open_square = 0
count_clouse_square = 0
count_open_wave = 0
count_clouse_wave = 0
#p a = "([[]]{)}"
#bool = false
first_clouse_circle_bool = true
p a = "({)}"
a = a.split("")
string_length = a.length
array = []
for i in 0..string_length
  case a[i]
    when "("
      array << a[i]
      
    when "["
      array << a[i]    
      
    when "{"
      array << a[i]

    when ")"
      p "array[-1] #{array[-1]}"
      first_clouse_circle_bool = false if array.empty?
      p "array[-1] #{array[-1]} i #{i}"
      if array[-1] === "(" then array.pop end
      
      #2) если закрывающая: сравниваем с последним из стэка
      #2.1) если совпадают то делаем поп
      #2.2) если нет то невалидный
      
    when "]"
      first_clouse_circle_bool = false if array.empty?
      p "array[-1] #{array[-1]} i #{i}"
      if array[-1] === "[" then array.pop end
      
    when "}"
      first_clouse_circle_bool = false if array.empty?
      p "array[-1] #{array[-1]} i #{i}"
      if array[-1] === "{" then array.pop end
      
    end
    p a[i]
end
  #if bool === true 
   # p "ciecle equal #{bool}" end
  if first_clouse_circle_bool === false
    p "first_clouse_circle_bool: #{first_clouse_circle_bool}" end
  if first_clouse_circle_bool === true
    p "first_clouse_circle_bool equal: #{first_clouse_circle_bool}" end

 #использования в выражениях 

=begin
p "______________Nend_list.each_char do |x|_______________________list.each do |x|_________"
list = "(adc(123[]{}))" 
list.each_char do |z|
  p "#{z}"
end
p "______________list.each do |x|_________"
list = list.split("")
list.each do |x|
  p "#{x} "
end

p a = "({)}"
def balance_p?(str)
  stack = []
  str.each_char do |ch|
    case ch
    when "("
      stack << ch
    when ")"
      if stack[-1] === "("
      return false if stack.empty?
    stack.pop
    end  
    p ch
  end
  true 
end
balance = "(adc(123))"
unbalance = ")asd(123))"
p balance_p?(unbalance)


  if a[i] === "(" 
    count_open_circle += 1
    array << a[i]
    bool = true

  elsif a[i] === ")"
    #p array[i]
    #array[i] === "("
    count_clouse_circle += 1
    bool = false
    array.pop

  elsif a[i] === "]" 
    count_open_square += 1 
  elsif a[i] === "["    
    count_clouse_square += 1 
  elsif a[i] === "{"
    count_open_wave += 1
  elsif a[i] === "}"    
    count_clouse_wave += 1

  elsif array.empty? && a[i] === ")"
    first_clouse_circle_bool = false
  end
=end
=begin
  p "count_open_square: #{count_open_square}"
  p "count_clouse_squere: #{count_clouse_square}"
  p "count_open_circle: #{count_open_circle}"
  p "count_clouse_circle: #{count_clouse_circle}"
  p "count_open_wave: #{count_open_wave}"
  p "count_clouse_wave: #{count_clouse_wave}"

p s1 = "Была темная грозовая ночь."
p words = s1.split # ["Была", "темная", "грозовая", "ночь]
p s3 = "львы и тигры и медведи"
p zoo = s3.split(/ и /) # ["львы", "тигры", "медведи"]
puts "[[1,5],
[3,2]]
Сумма 11
Результат
[[0,11],
[11,0]]"
#p a = [[2,4,1],[8,4,2],[5,3,3]]
#p "________________________________________________main diag here ______________"
#p "array: #{a.inspect}"
p a = [[2,4,1],[8,4,2],[5,3,3],[5,3,9,9],[5,3,3,8,9]]
p "________________________________________________sum"
p "sum: #{sum = a.flatten.inject(0){|sum, e| sum += e}}"

#p "array: #{
 # array = Array.new(3) { Array.new(3) { sum } }
  #}"
array_size = a.length-1
#(0..array_size).collect { |i| array[i][i]=0 }
#only for doble array
for i in 0..array_size
  for j in 0..array_size
    if i === j 
      a[i][j] = 0
    else
      a[i][j] = sum
    end  
  end
end
p "array: #{ a }"
p "________________________________________________to main diag"
puts "_________________ARRAYS:"
puts "a: #{a}"
#p "array: #{array}"
puts "_________________"
=begin
for i in 0..array_size
  for j in 0..array_size
    if i === 0 && j === 0 || i === array_size && j === array_size || i === array_size/2 && j === array_size/2
    array[i][j] = 0
    end
  end
end

for i in 0..array_size
  for j in 0..array_size
    array[i][j] = 0
  end
end

p a = [[2,4,1],[8,4,2],[5,3,3]]
p "________________________________________________sum"
p "sum: #{sum = a.flatten.inject(0){|sum, e| sum += e}}"
p "______________________________________________0 to main diag"
p "array: #{
  array = Array.new(3) { Array.new(3) { sum } }
  }"
array_size = array.length-1
(0..array_size).collect { |i| array[i][i]=0 }
p "array: #{ array }"
puts "_________________"

p a = [[2,4,1],[8,4,2],[5,3,3]]
p s = a.dup
b = a.clone
puts "a: #{a}"
p "s: #{s}"
require 'matrix'
p "array: #{
  array = Matrix.diagonal(1,2,3)
  }"
p sm = Matrix.scalar(3,1) 
diagonal_sum = 0


puts 'a:'
array_size.times do |i|
  array_size.times do |j|
    array_size.times do |x|

      p a[i][j][x] 
      x = array[i]

    end
  end
end
p m = [
 [32, 32, 32],
 [32, 32, 32],
 [32, 32, 32]
]
line = 32
colum = 2
c2 = 2


=end
=begin



lines = a.length
(0...lines).each do |l|
end

a = []

#print "enter count of lines: "
#lines = gets.chomp.to_i
#puts
#print "enter count of columns: "
#columns = gets.chomp.to_i
#puts
puts "Let's start enter data"
lines = 3
columns = a.length

(0...lines).each do |l|
  a[l] = []
  (0...columns).each do |c|
    print "[#{l}, #{c}] = "
    a[l] << gets.chomp.to_i
    puts
  end
end

a = [ "a", "b", "c" ]
a.index("b")              #=> 1
a.index("z")              #=> nil
p a.index {|x| x == "b"}    #=> 1
a = [ "q", "r", "s", "t" ]
a.first     #=> "q"
a.first(2)  #=> ["q", "r"]
s = [ 1, 2, 3 ]           #=> [1, 2, 3]
t = [ 4, 5, 6, [7, 8] ]   #=> [4, 5, 6, [7, 8]]
a = [ s, t, 9, 10 ]       #=> [[1, 2, 3], [4, 5, 6, [7, 8]], 9, 10]
p a.flatten                 #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a = [ 1, 2, [3, [4, 5] ] ]
a.flatten(1)              #=> [1, 2, 3, [4, 5]]

# Объявили пустой массив
array = []

# Спрашивает у пользователя длину массива и записываем ее в number
puts '____Введите N'
number = gets.to_i

# Создадим переменную-счетчик итераций в цикле. Сначала он будет равен 1, так
# как числа в массиве должны быть от 1 до N.
index = 1

# Переменная, в которую будет накапливать сумму всех чисел
summa = 0

# Нам нужно N (number) чисел, значит нам нужно ровно number число итераций
while index <= number do
  # Записываем очередное число в массив
  array << index

  # Увеличиваем сумму
  summa += index

  # Увеличиваем счетчик для следующей итерации
  index += 1
end

# Выводим получившийся массив и сумму его чисел
puts array.to_s
puts 'Сумма чисел: ' + summa.to_s

# PS
#
# Сумму можно было не считать в цикле, а получить из финального массива
#
# array.inject(0) { |sum,x| sum + x }
#
# А начиная с Ruby 2.4.0 сумму можно вычислить простым методом sum
#
# array.sum

=begin
a = [1,5,3,1,6,7,2] 
puts a
puts "_________________"
a = [1,5,3,1,6,7,2] 
i =0
size = a.length - 1
while i < a.length do
    for i in 0...size
      a_i = a[i]
      a[i] = a[i+1]
      a[i+1] = a_i
    end
    size -= 1
  i += 1
end
puts a
=begin
i = 1
a = [1,5,3,1,6,7,2] 
size = a.length - 1
while i < a.length do
  for i in 0...size
  #a[i], a[i+1] = a[i + 1], a[i] if a[i] > a[i + 1]
  if a[i] > a[i + 1] then
  a_l = a[i + 1]
  a[i+1] = a[i]
  a[i] = a_l
  end
  end
  size -= 1
  i += 1
end
puts a
=begin
i =0
size = a.length - 1
while i < a.length do
    for i in 0...size
      a_i = a[i]
      a[i] = a[i+1]
      a[i+1] = a_i
    end
    size -= 1
  i += 1
end
puts a

#puts x = a[2]          
#print
=begin
i = 1
a = [1,5,3,1,6,7,2] 
size = a.length - 1
while i < a.length do
  for i in 0...size
  a[i], a[i+1] = a[i + 1], a[i] if a[i] > a[i + 1]
  end
  size -= 1
  i += 1
end
puts a
=end
=begin
i=0
while i < a.size do
 print "#{a[i]} "
 i += 1
end

while i < a_length do
 while j < a_length-1 do 
    #if a[i] > a[i+1] 
    for i in 0...size
      # => a[i], a[i+1] = a[i + 1], a[i] if a[i] > a[i + 1]
      #a_lower = a[i+1]
      #a[i+1] = a[i]
      #a[i] = a_lower
      a_l = a[i]
      a[i] = a[i+1]
      a[i+1] = a_l
    end
    size -= 1
    j += 1
  end
  
  i += 1
end
puts a

puts "_________________"
#puts a
arr = [1,5,3,1,6,7,2] 
swap = true
size = arr.length - 1
while swap
  swap = false
  for i in 0...size #7
    swap |= arr[i] > arr[i + 1]
    arr[i], arr[i+1] = arr[i + 1], arr[i] if arr[i] > arr[i + 1]
  end
  size -= 1
end
puts arr.join(' ')
# output => 1 1 2 3 5 6 7
puts "_________________"
=begin

#squares = [1,2,3,4,5]
#puts squares
#squares = [1,2,3,4,5].collect do |x| x**2 end.reverse
#  puts squares


#puts a
puts "_________________"

if a[a_length] < words[a_length-1] 
     a+=1
     a_length_lower = words[a_length-1]
     a[a_length-1] = a[a_length]
     a[a_length] = a_length_lower
     puts a[a_length-1]
     puts a[a_length]
   
end


=begin

class Object
  attr_reader :alpha, :beta
  attr_writer :gamma
  attr_accessor :epsilon
  def accessor?(sym)
    return (self.respond_to?(sym) and self.respond_to?(sym+"="))
  end
end
asd = Object.new()
puts "puts asd.accessor?(:alpha) :gamma чтение установка атрибута с именем :epsilon "
puts asd.accessor?(:alpha)
puts asd.accessor?(:gamma)
puts asd.accessor?(:epsilon)

class Car2
  attr_reader :alpha, :beta
  attr_writer :gamma, :delta
  attr_accessor :epsilon, :speed, :model, :color # переменныу объекта экземпляра
    #def new
    #  @car = Car2.new
    #end
  def accessor?(sym)
    return (self.respond_to?(sym) and self.respond_to?(sym+"="))
  end
  def self.find_by_id(id)
    Task.find(id)             # self.find(id)        тут будет эквивалентно так как у метода идёт 'def self.'
  end
  def initialize(speed, model, color, epsilon) #конструктор
    @speed = speed
    @model = model
    @color = color
    @epsilon = epsilon
    # Это переменные экземпляра конструкторы
  end
  def isSpeed
    if @speed > 10
      return true
    
    else
      return false
    end
  end  
  def printString
  string11 = "String\nNexstring\nOnemorestring"
  num = 0
    #string11.each do |line|
    #num +=1
    #print "String #{num}_ #{line}"
    #end
    if string11 > ""
      num +=1
    print "String #{num}_ #{string11}"
    a = "QWEERT"
    b = :resurrect
    a == a.to_sym
    b == b.to_s #to_str
    print a
    print b
    end

  end  
end

class Extreme < Car2
  attr_accessor :whatewer
  def whatever
    @whatewer
  end
  def whatever=(val)
    @whatewer = val
  end
  def putsWhatever
    puts "whatewer #{whatewer}"
  end
end  

bmv = Car2.new(230, "a", "a", "b")
puts "bmv.isSpeed"
puts bmv.isSpeed
puts "bmv.accessor?(:alpha)"
puts bmv.accessor?(:alpha)
extreme1 = Extreme.new(90, "a", "any", "c")
extreme1.whatewer()
extreme1.putsWhatever
print "print Extreme.speed " 
puts extreme1.isSpeed
print "print Extreme.color " 
puts extreme1.color
puts extreme1.printString

def mymethod(a, b, *c)
  print a, b
  c.each do |x| print x end
end
mymethod(1,2,3,4,5,6,7)


=begin


#Friend.our_common_friend # Все мы друзья Эндрю.
#ruby -r "./test.rb" -e "Friend.our_common_friend"

#puts Time.now
#@task = "2020-09-05 18:08:32 +0300"
#puts @task
=begin
class Qwert

  def task
    @task = Time.gm(2012)
    if @task < Time.now 
      
      puts "Expired"
      return "Expired" 
    else 
      return nil
    end
    puts "123"  
  end
  
end
f = Qwert.new
  f.task

f1 = Qwert.new
f1.task

=begin

    if a = @task < Time.now ? "Expired" : nil
      puts a#"In progress"
      #task.deadline > Time.now
      # Time.gm
    else
      puts a#"Expired"
      puts @task
    end

class Friend
 @@myname = "Эндрю" # переменная класса
 def initialize(name, sex, phone)
 @name, @sex, @phone = name, sex, phone
 # Это переменные экземпляра
 end
 def hello # метод экземпляра
 puts "Привет, я #{@name}.#{@sex} #{@phone}"
 end
 def Friend.our_common_friend # метод класса
 puts "Все мы друзья #{@@myname} ."
 end
end

#f1 = Friend.hello("Сюзанна","F","555-0123")
f2 = Friend.new("Том","M","555-4567")
Friend.hello # Привет, я Сюзанна.
f2.hello # Привет, я Том.

puts Float::MIN
puts 3.0 / 4 


str = "a123b45c678"
if /(a\d+)(b\d+)(c\d+)/ =~ str
 puts "Частичные соответствия: '#$1', '#$2', '#$3'"
 # Печатается: Частичные соответствия: 'a123', 'b45', 'c768'
end 

str = "12345"
new_string = [str].pack("u")
puts new_string
original = new_string.unpack("u")
puts original
str = "ABC"
chars = str.scan(/./)
chars.each {|char| print char, " " }
# Результат: A B C.
s2 = %q{Другая строка.}
s3 = %Q[А это табуляция: (\t)] # Равнозначно "А это табуляция: \t"
puts s3
puts s2.size

x = 6
y = x == 5 ? 0 : 1 # y равно 1.
x == 5 ? puts("Привет") : puts("Пока") # Печатается: "Пока"
i = 0
x = while (i<5)
  puts i+=1
end  
x = while (i < 5) # x равно nil.
 puts i+=1
end
#замыкание
def power(exponent)
 proc {|base| base**exponent}
end
square = power(2)
cube = power(3)
a = power(2).call(2) # Результат равен 121.
puts a
# ** - оператор возведения в степень
squares = [1,2,3,4,5]
puts squares
squares = [1,2,3,4,5].collect do |x| x**2 end.reverse
  puts squares

x = 11
case x
 when 0
 when 1..5.to_a #x = [1, 2, 3, 4, 5]
 puts "Вторая ветвь"
 when 5...11
 puts "Третья ветвь"
else
 puts "Четвертая ветвь"
end
case "Hello"
 when /Hell/
 puts "Есть соответствие."
else
 puts "Нет соответствия."
end
case /Hell/
 when "Hello"
 puts "Есть соответствие."
else
 puts "Нет соответствия."
end
x = "A"
puts "x[0] = #{x[0]}" # Печатается x[0] = 72  - A
#Hearts = :Hearts # Это один из способов присвоить
class Friend
 @@myname = "Эндрю" # переменная класса
 def initialize(name, sex, phone)
 @name, @sex, @phone = name, sex, phone
 # Это переменные экземпляра
 end
 def hello # метод экземпляра
 puts "Привет, я #{@name}.#{@sex} #{@phone}"
 end
 def Friend.our_common_friend # метод класса
 puts "Все мы друзья #{@@myname} ."
 end
end
f1 = Friend.new("Сюзанна","F","555-0123")
f2 = Friend.new("Том","M","555-4567")
f1.hello # Привет, я Сюзанна.
f2.hello # Привет, я Том.
#Friend.our_common_friend # Все мы друзья Эндрю.
#ruby -r "./test.rb" -e "Friend.our_common_friend"
=end
=begin
class Object
  attr_reader :alpha, :beta
  attr_writer :gamma
  attr_accessor :epsilon
  
end
asd = Object.new()
puts "puts asd.accessor?(:alpha) :gamma чтение установка атрибута с именем :epsilon "


class Car2
  attr_reader :alpha, :beta
  attr_writer :gamma, :delta
  attr_accessor :epsilon, :speed, :model, :color # переменныу объекта экземпляра
    #def new
    #  @car = Car2.new
    #end

  def self.find_by_id(id)
    Task.find(id)             # self.find(id)        тут будет эквивалентно так как у метода идёт 'def self.'
  end
  def initialize(speed, model, color, epsilon) #конструктор
    @speed = speed
    @model = model
    @color = color
    @epsilon = epsilon
    # Это переменные экземпляра конструкторы
  end
  def isSpeed
    if @speed > 10
      return true
    
    else
      return false
    end
  end  
  def printString
  string11 = "String\nNexstring\nOnemorestring"
  num = 0
    #string11.each do |line|
    #num +=1
    #print "String #{num}_ #{line}"
    #end
    if string11 > ""
      num +=1
    print "String #{num}_ #{string11}"
    a = "QWEERT"
    b = :resurrect
    a == a.to_sym
    b == b.to_s #to_str
    print a
    print b
    end

  end  
end

class Extreme < Car2
  attr_accessor :whatewer
  def whatever
    @whatewer
  end
  def whatever=(val)
    @whatewer = val
  end
  def putsWhatever
    puts "whatewer #{whatewer}"
  end
end  

bmv = Car2.new(230, "a", "a", "b")
puts "bmv.isSpeed"
puts bmv.isSpeed
puts "bmv.accessor?(:alpha)"

extreme1 = Extreme.new(90, "a", "any", "c")
extreme1.whatewer()
extreme1.putsWhatever
print "print Extreme.speed " 
puts extreme1.isSpeed
print "print Extreme.color " 
puts extreme1.color
puts extreme1.printString

def mymethod(a, b, *c)
  print a, b
  c.each do |x| print x end
end
mymethod(1,2,3,4,5,6,7)

p "---------------------------------------------------------------"
=end