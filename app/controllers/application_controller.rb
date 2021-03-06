class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper # доступен и во всех контроллерах
  
  def hello # метод экземпляра
   puts "Привет, я #{@name}."
  end

  def hello2
    render text: "def hello2"
  end  
  

  def hello3
    str =  "111.1 C"
    temp = str
    temp = temp.to_f
    case str
      when str
      f = 1.8*temp + 32
      str = f
      when "F", "f"
      c = (5.0/9.0)*(temp-32)
      str = c
    end
    render text: str

    $NOT_CONST = "$NOT_CONST"
    #render text: "def hello render text:hello, world! end"+" "<<$NOT_CONST
  end

    private

    # Проверяет статус входа пользователя.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  # В этом разделе пользователь будет входить с помощью куки временной сессии, которая автоматически завершается после 
  #  закрытия браузера. модуль Sessions helper был автоматически создан при генерации контроллера Sessions 
  # Более того, такие хелперы автоматически доступны в Rails-представлениях; а если указать модуль в/* ::Base */базовом классе 
  # всех контроллеров (контроллер Application), то он станет так же доступен и во всех контроллерах
  

  # Определяем действие, которое возвращает обект код ruby
  # маршрутизатор Rails, находится перед контроллером
  
  # config Над MVC Controllers папка командует парадом над (GUI)views и models(пользователи, статьи, продукты, БД)
  # Браузер отправляет запрос, веб-сервер принимает этот запрос, и передаёт его в Rails-контроллер
  # Этот контролер ApplicationController routs.rb root куда 
  # Сейчас стартует class StaticPagesController < ApplicationController который наследует этот контролер 
  # Вызов метода(действие) так как в routs.rb  путь  root 'static_pages#home'
  # def home (home.html.erb)
  # end
  # models сейчас обходит и сразу идет в views к 
  # реилс определяет какая страница будет запущенна Rails.application.routes.draw do
  # root 'static_pages#home'   application.html.erb  
  # генерица страница home.html.erb
  #def hello
  #  render text: "hello, world!"
  #end
  #
end