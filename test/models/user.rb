#class User < ActiveRecord::Base
 #     before_save { self.email = email.downcase }
# Адреса электронной почты обычно обрабатываются, как если бы они были нечувствительны к регистру — т.е., foo@bar.com считается равным FOO@BAR.COM или FoO@BAr.coM
  #validates :name,  presence: true, length: { maximum: 50 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, length: { maximum: 255 },
  #                  format: { with: VALID_EMAIL_REGEX },
  #                  uniqueness: true
  #                  uniqueness: { case_sensitive: false }
  #validates(:name, presence: true)
  #validates :email, presence: true
  # validates — это просто метод.
  # валидации наличия имени является метод validates с аргументом presence: true
  # Аргумент presence: true — это хэш опций с одним элементом;
  # фигурные скобки необязательны, если хэш передаётся последним аргументом в метод.
#end
# для отката      bundle exec rake db:rollback rake db:abort_if_pending_migrations     rake db:migrate
# (called from block (2 levels) in <class:Railtie> at /home/nomid/.rvm/gems/ruby-2.3.3/gems/sass-rails-5.0.2/lib/sass/rails/railtie.rb:58)
#== 20191229143125 CreateUsers: migrating ======================================
#-- create_table(:users)
   
#== 20191229143125 CreateUsers: migrated (0.0023s) =============================

#== 20191231093417 CreateMicroposts: migrating =================================
#-- create_table(:microposts)

#== 20191231093417 CreateMicroposts: migrated (0.0009s) ========================

#== 20200125102959 AddIndexToUsersEmail: migrating =============================-- add_index(:users, :email, {:unique=>true})
   
#== 20200125102959 AddIndexToUsersEmail: migrated (0.0010s) ====================
#https://stackoverflow.com/questions/21309901/getting-migrations-are-pending-run-bin-rake-dbmigrate-rails-env-development