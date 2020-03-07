class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # В этом разделе пользователь будет входить с помощью куки временной сессии, которая автоматически завершается после закрытия браузера. модуль Sessions helper был автоматически создан при генерации контроллера Sessions (Раздел 8.1.1). Более того, такие хелперы автоматически доступны в Rails-представлениях; а если указать модуль в базовом классе всех контроллеров (контроллер Application), то он станет так же доступен и во всех контроллерах
  include SessionsHelper  

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