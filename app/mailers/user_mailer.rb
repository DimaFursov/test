class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #Кроме всего прочего, в этом коде есть переменная экземпляра (@greeting), 
  #которая доступна в представлениях мэйлера, так же как переменные экземпляра из 
  #контроллеров доступны в обычных представлениях.
  def account_activation(user)
    @greeting = "Hi"

    @user = user
    mail to: user.email, subject: "Account activation"
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
