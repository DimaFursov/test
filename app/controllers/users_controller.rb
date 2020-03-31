class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  # перенаправления пользователя
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  # GET /users
  # GET /users.json
=begin
Предфильтры применяют команду before_action для указания конкретному методу на то, что он должен быть вызван до заданных
 действий.3 Для того, что потребовать от пользователей войти на сайт, мы определим метод logged_in_user и вызовем его
 через before_action :logged_in_user
2-Rails направляет /users к действию index в контроллере Users.
3-Действие index запрашивает у модели User получение всех пользователей (User.all).
4-Модель User вытягивает всех пользователей из базы данных.
5-Модель User возвращает список пользователей в контроллер.
6-Контроллер получает пользователей в переменной @users, которую он передаёт представлению index.

=end
  def index
    @users = User.paginate(page: params[:page])
  end
=begin хеш - page
>> User.paginate(page: 1) 
  User Load (1.5ms)  SELECT "users".* FROM "users" LIMIT 30 OFFSET 0
   (1.7ms)  SELECT COUNT(*) FROM "users"
=> #<ActiveRecord::Relation [#<User id: 1,...
=end

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
        UserMailer.account_activation(@user).deliver_now
        flash[:info] = "Please check your email to activate your account."
        redirect_to root_url        
        #log_in @user        
        #flash[:success] = "Welcome to the Sample App!"
        #redirect_to @user
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.json { render :show, status: :created, location: @user }
      else
        #render 'new'
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
# метод user_params (который возвращает соответствующий инициализационный хэш) и используют его вместо params[:user]:  
  
  # GET /users/1/edit Вспомните, что id пользователя доступен в переменной params[:id]
  #Вместо действия new, отображающего представление для нового пользователя, есть edit 
  def edit
    @user = User.find(params[:id])    
  end
    # PATCH/PUT /users/n/edit
  # PATCH/PUT /users/1.json
  #вместо create, отвечающего на запрос POST, есть действие update и запрос PATCH 
  # PATCH /users/1  update  user_path(user) обновление пользователя с id 1 
  def update
    #Предфильтр correct_user определяет переменную @user, поэтому мы можем ликвидировать присвоение @user в действиях edit и update.
    # @user = User.find(params[:id])
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
# DELETE /users/1
  # DELETE /users/1.json 
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
    #@user.destroy
    #respond_to do |format|
    #  format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Предфильтры

    # Подтверждает вход пользователя Чтобы использовать store_location, необходимо добавить его в предфильтр logged_in_user
    def logged_in_user
      unless logged_in?
        store_location ## Сохраняет запрошенный URL.session под ключом :forwarding_url
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    # Подтверждает правильного пользователя
    def correct_user
      @user = User.find(params[:id])
      # unless @user == current_user
      redirect_to(root_url) unless current_user?(@user)
    end    
    # Подтверждает администратора.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  #end  





