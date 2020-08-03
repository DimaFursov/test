module SessionsHelper
  # Осуществляет вход данного пользователя. Метод rails отправляет браузеру времменные куки
  def log_in(user)
    session[:user_id] = user.id
  end
    # Запоминает пользователя в постоянной сессии.
=begin       
Как и с log_in, Листинг 8.34 передает всю настоящую работу Sessions-хелперу,
 где мы определяем метод remember, вызывающий user.remember, тем самым он 
 генерирует remember-токен и сохраняет в базу данных его дайджест. Затем 
 он применяет cookies для создания постоянных куки пользовательского id и remember-токена  
 В результате, оценка доходит до конца метода current_user и возвращает nil, как и требовалось.

Напротив, когда мы закрываем Chrome, то сбрасываем session[:user_id] на nil 
(так как у всех переменных session автоматически истекает срок годности при закрытии браузера), 
но user_id в cookie остается в целости и сохранности. А значит, соответствующий пользователь будет найден в базе данных  
=end
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
  # если невошедший пользователь пытается посетить страницу редактирования, то после входа он будет перенаправлен
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Сохраняет запрошенный URL.Метод store_location помещает запрашиваемый URL 
  # в переменную session под ключом :forwarding_url, но только в случае запроса GET.выдаст запрос GET к URL
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
    # Забывает постоянную сессии.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
    # Осуществляет выход текущего пользователя.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
end