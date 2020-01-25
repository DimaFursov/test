require 'test_helper'

class UserTest < ActiveSupport::TestCase
#  Так как @user — это переменная экземпляра, то она автоматически доступна во всех тестах, и мы можем тестировать её валидность методом valid?
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end
# метод assert, который в данном случае будет успешным при возвращении true от @user.valid?, и провальным при возвращении false.
  test "should be valid" do
    assert @user.valid?
  end
end