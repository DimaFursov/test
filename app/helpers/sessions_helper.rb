module SessionsHelper

  # Этот код помещает в браузер пользователя временные куки с зашифрованной версией пользовательского id, и это позволяет нам получить id на следующей странице через session[:user_id]
  def log_in(user)
    session[:user_id] = user.id
  end
end