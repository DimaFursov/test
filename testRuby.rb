puts "
([]([{[]}]))
"
=begin
puts "[[1,5],
[3,2]]
Сумма 11
Результат
[[0,11],
[11,0]]"
#p a = [[2,4,1],[8,4,2],[5,3,3]]
#p "________________________________________________"
#p "array: #{a.inspect}"
p a = [[2,4,1],[8,4,2],[5,3,3],[5,3,9,9],[5,3,3,8,9]]
p "________________________________________________sum"
p "sum: #{sum = a.flatten.inject(0){|sum, e| sum += e}}"
p "______________________________________________0 to main diag"
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