class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def about
  end

  def contact
  end

  def string_messag(str = '')

   if str.empty? "empty"
   else "The string is nonempty."
   end
  end
# flash.each do |key, value|
# puts "Key #{key.inspect} has value #{value.inspect}"
  
# def string_message(str = '')
#  return "It's an empty string!" if str.include?("foo")
#  return "Chui we're home"
#end

#def string_message(str = 'Home')
#  return "Chui we're home"
#end
end
class Word < String             # Word наследуется от String.
   def palindrome?
     self == self.reverse # self - это сама строка.
     # return "1Chui we're home1"
   end
end
class Myclass
  def String(str = '')
    return if str.empty? 
     # str == str
     # self == self
    return format.html {"str"} #"Chui we're home"
  end
end
