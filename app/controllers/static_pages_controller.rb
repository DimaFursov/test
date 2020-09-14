class StaticPagesController < ApplicationController
=begin  
  def home
    #определяем микропост переменной экземпляра @micropost "if logged_in?" current_user Существует только для logged_in?
    @micropost = current_user.microposts.build if logged_in? 
  end
=end
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @project = current_user.projects.build
      @feed_itemsprojects = current_user.feedprojects
      #feed_items.any?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
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
    return "MYcalss_empty" if str = "Homr"  
   # str == str
     # self == self
    return "Chui we're home?" #format.html {"Chui we're home"} "Chui we're home"
  end
  def string_message(str = '')
  # return "It's an empty string!" if str = "H"
  return "Chui we're hom"
 end
end
  #if  Tine.now > task.deadline
  # if date > task_params[:deadline]    
  # taskDeadLine = Task.find(params[:deadline])
  # if date > taskDeadLine
  # t = date > taskDeadLine puts t
  # date = Time.now
=begin
  # "2020-12-31 00:57:46" ["created_at", "2020-09-04 10:41:06.362186"], ["updated_at", "2020-09-04 10:41:06.362186"]]
  # deadline: nil, project_id: nil, created_at: nil, updated_at: nil,
  task.created_at Fri, 04 Sep 2020 10:41:06 UTC +00:00
  task.update_attributes(name: "The Dude", project_id: "1")
  
  Tine.now > task.deadline
  
  mm/dd/yy hh:mm:ss
  datetime = /(\d\d)\/(\d\d)\/(\d\d) (\d\d): (\d\d):(\d\d)/
  mo = /(0?[1-9]|1[0-2])/ # От 01 до 09 или от 1 до 9 или 10-12.
  dd = /([0-2]?[1-9]|[1-3][01])/ # 1-9 или 01-09 или 11-19 и т. д.
  yy = /(\d\d)/ # 00-99
  hh = /([01]?[1-9]|[12][0-4])/ # 1-9 или 00-09 или...
  mi = /([0-5]\d)/ # 00-59, обе цифры должны присутствовать.
  ss = /([0-6]\d)?/ # Разрешены еще и доли секунды ;-)
  date = /(#{mo}\/#{dd}\/#{yy})/
  time = /(#{hh}:#{mi}:#{ss})/
  str="Recorded on 11/18/07 20:31:00"
  str.scan(datetime)
  # [["11/18/07 20:31:00", "11/18/07", "11", "18", "00",
  # "20:31:00", "20", "31", ":00"]]

  datetime = %r{(
   (0?[1-9]|1[0-2])/ # mo: от 01 до 09 или от 1 до 9 или 10-12.
   ([0-2]?[1-9]|[1-3][01])/ # dd: 1-9 или 01-09 или 11-19 и т. д.
   (\d\d) [ ] # yy: 00-99
   ([01]?[1-9]|[12][0-4]): # hh: 1-9 или 00-09 или...
   ([0-5]\d): # mm: 00-59, обе цифры должны присутствовать.
   (([0-6]\d))? # ss: разрешены еще и доли секунды ;-)
  )}x
=end