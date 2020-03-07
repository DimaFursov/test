module SessionsHelper

  # Этот код помещает в браузер пользователя временные куки с зашифрованной версией пользовательского id, и это позволяет нам получить id на следующей странице через session[:user_id]
  def log_in(user)
    session[:user_id] = user.id
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end  
=begin   
   if @current_user.nil?
   @current_user = User.find_by(id: session[:user_id])
   else
   @current_user
   end 
=end   
    #@current_user = @current_user || User.find_by(id: session[:user_id]) 
  def logged_in?
    !current_user.nil?
  end  
=begin    
    <% if logged_in? %>
  # Ссылки для вошедших пользователей
<% else %>
  # Ссылки для невошедших пользователей
<% end %>
=end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end     
end