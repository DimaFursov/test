class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token
  # Так как каждый вновь зарегистрированный пользователь потребует активации, мы должны присвоить
  # активационный токен и дайджест каждому объекту User, прежде чем он будет создан
  before_save   :downcase_email
  # Эта функция автоматически вызывается перед сохранением объекта, как при создании, так и при обновлении
  # ссылка на метод
  before_create :create_activation_digest
  # происходит до создания пользователя.
  has_many :microposts  
# Адреса электронной почты обычно обрабатываются, как если бы они были нечувствительны к регистру — т.е., foo@bar.com считается равным FOO@BAR.COM или FoO@BAr.coM
  before_save { self.email = email.downcase }
  # before_save и переводит адрес электронной почты пользователя в строчную версию его текущего значения, применив строковый метод downcase
  # before_save { self.email = self.email.downcase }
  # self внутри модели User ключевое слово self необязательно
  validates :name,  presence: true, length: { maximum: 50 }
  # Регулярное выражение VALID_EMAIL_REGEX — это константа, которая обозначается в Ruby именем, начинающимся с заглавной буквы
  # оно позволяет недопустимые адреса, содержащие последовательно расположенные точки, например foo@bar..com.
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Код приложения для валидации формата электронной почты использует format
  #validates :email, format: { with: /<regular expression>/ },
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }    
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
=begin  # При включении в модель этот метод добавляет следующую функциональность:
Возможность сохранять безопасно хэшированный атрибут password_digest в базу данных
Пару виртуальных атрибутов22 (password и password_confirmation), вместе с валидацией их наличия при создании объекта и валидацией их совпадения
Метод authenticate, который возвращает пользователя в ответ на верный пароль (иначе false)    
=end
                    # uniqueness: true, #на case_sensitive: false                     
                    #---------------------------------------------------------
                    #uniqueness: true # создать пользователя с таким же адресом электронной почты, как и у @user, применив @user.dup и создав таким образом дубликат пользователя с такими же атрибутами.
# Так как после этого мы сохраняем @user, то адрес электронной почты дублированного пользователя уже существует в базе данных, следовательно, он не должен быть валидным.                    
  #(В этом выражении есть один заметный недостаток: оно позволяет недопустимые адреса, содержащие последовательно расположенные точки, например foo@bar..com. Устранение этого недочета требует гораздо более сложного регулярного выражения и оставлено в качестве упражнения (Раздел 6.5).)
  #validates :email, presence: true
  # validates — это просто метод.
  # валидации наличия имени является метод validates с аргументом presence: true
  # Аргумент presence: true — это хэш опций с одним элементом;
  # фигурные скобки необязательны, если хэш передаётся последним аргументом в метод.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  private

    # Переводит адрес электронной почты в нижний регистр.
    def downcase_email
      self.email = email.downcase
    end
    # перед созданием пользователя Создает 
    # хэш activation_digest string и присваивает активационнй токен и дайджест.
    def create_activation_digest
      self.activation_token  = User.new_toke#app/models/user.rb:55:in `create_activation_digest'
      self.activation_digest = User.digest(activation_token)#хэш string
    end

    #Запоминает пользователя в базе данных для использования в постоянной сессии.
    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end    
end