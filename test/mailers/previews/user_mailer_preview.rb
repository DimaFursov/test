# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Предпросмотр этого письма на
  # http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.last #user name
    user.activation_token = User.new_token # self.activation_token  = User.new_toke-'n' хэш
    UserMailer.account_activation(user)
    
  end
  

  # Предпросмотр этого письма на
  # http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end

end