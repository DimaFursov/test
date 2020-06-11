class SessionsController < ApplicationController
  # get (При выполнении new будут в том числе созданы и представления, поэтому мы здесь не указываем действия create и destroy, у которых нет представлений.)
  def new
  end
  # post update отправко хеша заполненной формы логина емейл пароль params[:session][:email] масив
  # destroy DELETE к маршруту logout.
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        #if user.activated?
        log_in user
        #remember user #super  Did you mean? remember_token
        redirect_to user
        #params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        #redirect_back_or user
      #else
        #message  = "Account not activated. "
        #message += "Check your email for the activation link."
        #flash[:warning] = message
        #redirect_to root_url
      #end  
    
    #params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    #redirect_to user_url(user) #redirect_to user        
    #redirect_back_or user
      # Осуществить вход пользователя и перенаправление на страницу профиля.
      # Выдать сообщение об ошибке. authenticate возвращает false при сбое аутентификации
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
#-------------gemfileneedcheck_dropdownstyle
  def destroy
    log_out
    redirect_to root_url
  end
end