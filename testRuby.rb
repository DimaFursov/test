x = %w[alpha bravo charlie delta echo foxtrot]
# Получить начальные буквы.
a = x.collect {|w| w[0..0]} # %w[a b c d e f]
# Получить длины строк.
b = x.collect {|w| w.length} # [5, 5, 7, 5, 4, 7]
# map – просто синоним.
c = x.map {|w| w.length} # [5, 5, 7, 5, 4, 7]
puts b

a = Array.[](1, 2, 3, 4)
b = Array[1,2,3,4]
c = [1,2,3,4]
d = Array.new(10, "initialElementArray")# { |i|  }
puts d[0].capitalize!
puts d = Array.new(1) { "blah" }
puts d[0].capitalize!
puts y = d.values_at(1, 0, 10)
if d != "h" 
 puts "d != 'h'" 
end

class Symbol
  def +(other)
    (self.to_s + other.to_s).to_sym
  end
end

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