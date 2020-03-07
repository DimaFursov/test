class SessionsController < ApplicationController
  # get (При выполнении new будут в том числе созданы и представления, поэтому мы здесь не указываем действия create и destroy, у которых нет представлений.)
  def new
  end
  # post update
  # destroy DELETE к маршруту logout.
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    log_in user
    redirect_to user        
      # Осуществить вход пользователя и перенаправление на страницу профиля.
      # Выдать сообщение об ошибке. authenticate возвращает false при сбое аутентификации
    else
      flash.now[:danger] = 'Invalid email/password combination' # Не совсем верно!          
      render 'new'
    end
  end


  def destroy
  end
end