class User
  attr_accessor :name, :email

  def initialize(attributes = {})
    @name  = attributes[:name] # переменных экземпляра заключается в том, что они автоматически доступны в представлениях
    @email = attributes[:email]
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end
end