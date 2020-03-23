module SessionsHelper
  # Осуществляет вход данного пользователя.
  # Этот код помещает в браузер пользователя временные куки с зашифрованной версией пользовательского id, и это позволяет нам получить id на следующей странице через session[:user_id]
  def log_in(user)
    session[:user_id] = user.id
  end
    # Запоминает пользователя в постоянной сессии.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
    # Возвращает true, если заданный пользователь является текущим. unless @user == current_user unless current_user?(@user)
  def current_user?(user)
    user == current_user
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
    #не работает ----------------------------------------------------------------------------------------------------
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
Так как ссылка “Log out (Выход)” уже определена (Листинг 8.16),
 нам достаточно всего лишь написать верное действие контроллера для уничтожения пользовательской сессии.
=end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end     
end