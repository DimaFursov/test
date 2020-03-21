source 'https://rubygems.org'

gem 'rails',                '4.2.2'
gem 'bcrypt',               '3.1.7'
=begin
Для создания дайджест-пароля has_secure_password использует продвинутую хэш-функцию bcrypt.
 При хэшировании пароля через bcrypt можно быть уверенным — злоумышленник не сможет войти 
 на сайт, даже если ему удастся получить копию базы данных. Чтобы воспользоваться bcrypt 
 в учебном приложении, необходимо добавить гем bcrypt в
=end
gem 'bootstrap-sass', '~> 3.4.1'
gem 'sass-rails',           '5.0.2'
gem 'uglifier',             '2.5.3'
gem 'coffee-rails',         '4.1.0'
gem 'jquery-rails',         '4.0.3'
gem 'turbolinks',           '2.3.0'
gem 'jbuilder',             '2.2.3'
gem 'sdoc',                 '0.4.0', group: :doc

group :development, :test do
  gem 'sqlite3',     '1.3.9'
  gem 'byebug',      '3.4.0'
  gem 'web-console', '2.0.0.beta3'
  gem 'spring',      '1.1.3'
end
group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
end
group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
end