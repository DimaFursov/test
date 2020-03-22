class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
=begin
2-Rails направляет /users к действию index в контроллере Users.
3-Действие index запрашивает у модели User получение всех пользователей (User.all).
4-Модель User вытягивает всех пользователей из базы данных.
5-Модель User возвращает список пользователей в контроллер.
6-Контроллер получает пользователей в переменной @users, которую он передаёт представлению index.

=end
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
=begin
представление user show 
определяем переменную 
@user в соответствующем действии show контроллера Users. 
используем метод find для модели User
для получения пользователя из базы данных
--- !ruby/hash-with-ivars:ActionController::Parameters
elements:
  controller: users
  action: show
  id: '10'
ivars:
  :@permitted: false
=end  
  def show
    @user = User.find(params[:id])
    #debugger  #С ней можно обращаться так же, как с Rails-консолью Ctrl-D
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json

  # resources :users
  #  автоматически обеспечивает наше Rails-приложение возможностью отвечать на RESTful URL’ы из Таблицы 7.1. В частности, запрос POST к /users обрабатывается действием create.
=begin
   def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      # Обработать успешное сохранение.  
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
=end 
=begin
 #@user = User.new(params[:user])
    #params.require(:user).permit(:name, :email, :password, :password_confirmation)
Для облегчения использования этих параметров обычно вводят вспомогательный 
метод user_params (который возвращает соответствующий инициализационный хэш) и используют его вместо params[:user]:    
=end     

  def create
   
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save        
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        render 'new'
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
=begin  
  def create
      #user = User.new(params[:user])
    @user = User.new(user_params)
      respond_to do |format|
      if @user.save
      flash[:success] = "Welcome to the Sample App!"        
      redirect_to @user
      format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.json { render :show, status: :created, location: @user }
      #redirect_to @user # Обработать успешное сохранение.
      else
      render 'new'  
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
      end
  end
>> user.errors.full_messages
=> ["Email is invalid", "Password is too short (minimum is 6 characters)"]
Объект errors.full_messages (мы видели его краем глаза в Разделе 6.2.2) содержит массив сообщений об ошибках.  
=end  
  #private
    # Never trust parameters from the scary internet, only allow the white list through.
# метод user_params (который возвращает соответствующий инициализационный хэш) и используют его вместо params[:user]:  
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])    
  end
    # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json 
  def update
    @user = User.find(params[:id])
    #respond_to do |format|
      if @user.update_attributes(user_params) #@user.update_attributes(user_params)
        #format.html { redirect_to @user, notice: 'User was successfully updated.' }
        #format.json { render :show, status: :ok, location: @user }
        flash[:success] = "Profile updated"
        redirect_to @user        
      else
        render 'edit'
        #format.html { render :edit }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
#private мадификатор доступа чтобы к переменной или коду был доступ
# только у элементов содержащихся в том же объекте
# но как именно работает private?
  #private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  #end  



  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end





