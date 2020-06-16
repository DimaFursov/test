require 'test_helper'

class UserTest < ActiveSupport::TestCase
#  Так как @user — это переменная экземпляра, то она автоматически доступна во всех тестах, и мы можем тестировать её валидность методом valid?
# изначально валидный объект модели User @user с помощью специального метода setup
=begin
paul Harchenko, [06.03.20 15:24]
@user = User.new(name: "Example User", email: "user@example.com")
                     password: "foobar", password_confirmation: "foobar")

paul Harchenko, [06.03.20 15:24]
лишняя скобка и нет запятой

=end
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")    
  end
# метод assert, который в данном случае будет успешным при возвращении true от @user.valid?, и провальным при возвращении false.
  test "should be valid" do
    assert @user.valid?
  end
    test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
    test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
      # распознает адрес, заставивший тест провалиться
    end
  end
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  test "email addresses should be unique" do
    duplicate_user = @user.dup # создать пользователя с таким же адресом электронной почты, как и у @user
    #адресом, записанным прописными буквами
    duplicate_user.email = @user.email.upcase 
    @user.save
    #Так как после этого мы сохраняем @user, то адрес электронной почты дублированного пользователя уже существует в базе данных, следовательно, он не должен быть валидным.
    assert_not duplicate_user.valid?
  end
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
=begin
Начало с 0 
@user.password = @user.password_confirmation = "a" * 5
=end
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end
end