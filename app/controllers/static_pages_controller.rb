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
  


  
end

class Word < String             # Word наследуется от String.
   def palindrome?
     self == self.reverse # self - это сама строка.
     # return "1Chui we're home1"
   end
end
class Myclass
  def string(str = '')
    return if str.empty? 
     # str == str
     # self == self
    return "Chui we're home" #format.html {"Chui we're home"} "Chui we're home"
  end
  def string_message(str = '')
  # return "It's an empty string!" if str = "H"
  return "Chui we're hom"
 end
end
