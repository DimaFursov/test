# маршрутизатор Rails именно он определяет обекты
=begin
“Welcome” — имя контроллера, “index” — действие внутри этого контроллера.
r3oot 'welcome#inedx'
Rails.application.routes.draw do делает (ActionController::Base )

  StaticPagesController   #   def home   end

  View
  index.html.erb - html - Controller
  6.@user
  -
  Controller - user.add - model(user.rb) - database
  (Static_Pages_Controller.rb)
  2.ndex                     HTML
  RAILSrouter               -
  1./users
  -
  Brauser
1-Браузер выдает запрос на URL /users.
2-Rails направляет /users к действию index в контроллере Users.
3-Действие index запрашивает у модели User получение всех пользователей (User.all).
4-Модель User вытягивает всех пользователей из базы данных.
5-Модель User возвращает список пользователей в контроллер.
6-Контроллер получает пользователей в переменной @users, которую он передаёт представлению index.
7-Представление использует Embedded (Встроенный) Ruby, чтобы визуализировать страницу в виде HTML.
8-Контроллер возвращает HTML в браузе
=end
Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static_pages#home'
  get  'static_pages/home'
  get  'hello'=>'application#hello'#http://localhost:3000/hello
  get  'help'    => 'static_pages#help'
  get  'about'   => 'static_pages#about'
  get  'contact' => 'static_pages#contact'
  get  'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :microposts,          only: [:create, :destroy]#:show, :edit
  #1-Браузер выдает запрос на URL /users.
  #2-  Rails.application.routes.draw do 
  resources :users
  # после перехода по ссылке edit_account_activation_url(activation_token, ...)
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

end