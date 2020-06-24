class Relationship < ActiveRecord::Base
  #так как каждый читаемый пользователь однозначно определяется через followed_id, то можно превратить таблицу following в active_relationships
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  # Добавление валидации модели Relationship. столбцы с индексами
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
