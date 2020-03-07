module SessionsHelper

  # Этот код помещает в браузер пользователя временные куки с зашифрованной версией пользовательского id, и это позволяет нам получить id на следующей странице через session[:user_id]
  def log_in(user)
    session[:user_id] = user.id
  end
  def current_user
   if @current_user.nil?
   @current_user = User.find_by(id: session[:user_id])
   else
   @current_user
   end 
    #@current_user = @current_user || User.find_by(id: session[:user_id]) 
    # @current_user ||= User.find_by(id: session[:user_id])
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
  end  
end