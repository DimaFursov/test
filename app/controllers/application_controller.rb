class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # MVC Controllers папка командует парадом над (GUI)views
  # ПУп земли маршрутизатор! это контролер routs.rb root куда 
  # Сейчас стартует class StaticPagesController < ApplicationController который наследует этот контролер 
  # Вызов метода так как в routs.rb  путь  root 'static_pages#home'
  # def home
  # end
  # генерица страница 
  
end