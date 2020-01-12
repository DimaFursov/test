class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
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