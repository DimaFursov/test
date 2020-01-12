class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def about
  end

  def contact
  end

  def string_message(str = '')
  return "It's an empty string!" if str.noempty?
  return "Chui we're home"
  end
# def string_message(str = '')
#  return "It's an empty string!" if str.include?("foo")
#  return "Chui we're home"
#end
#def string_message(str = 'Home')
#  return "Chui we're home"
#end
end
