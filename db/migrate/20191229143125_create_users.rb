=begin
Одним из результатов команды generate является новый 
Файл миграции. метод change
Сама миграция представляет собой метод change, 
определяющий изменения, которые необходимо внести в базу данных.
Миграции обеспечивают возможность
 постепенного изменения структуры базы данных, так, чтобы модель данных могла адаптироваться 
 к изменяющимся требованиям. В случае модели User, миграция создается автоматически скриптом 
 генерации модели; она создает таблицу users с двумя столбцами, name и email
=end
class CreateUsers < ActiveRecord::Migration
  def change
=begin
    спользует объект t для создания столбцов name и email в базе данных
=end    
    create_table :users do |t|
      t.string :name
      t.string :email
      # какой то текст
      t.timestamps null: false
    end
  end
end
