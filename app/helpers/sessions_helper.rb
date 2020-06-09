module SessionsHelper
  # Осуществляет вход данного пользователя. Метод rails отправляет браузеру времменные куки
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
=begin  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
=end  
  #если пользователя нет или был обнулен nil ему прискаивается из базы 
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])#2 аргумента
        log_in user
        @current_user = user
      end
    end
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
Чтобы отправить пользователя в нужный ему пункт назначения, нужно где-то сохранить расположение запрашиваемой страницы, 
а затем перенаправить туда вместо страницы по умолчанию. Мы добьемся этого с помощью пары методов,
 store_location и redirect_back_or
=end
  # Перенаправляет к сохраненному расположению (или по умолчанию).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Сохраняет запрошенный URL.Метод store_location помещает запрашиваемый URL 
  # в переменную session под ключом :forwarding_url, но только в случае запроса GET.выдаст запрос GET к URL
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end     
end