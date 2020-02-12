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




  # Static_Pages_Controller.rb   #   def  home   end 
  root 'static_pages#home'





  get 'static_pages/home'
  #get 'home'    => 'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  #get  'static_pages/contact'
  get 'signup'  => 'users#new'
  resources :microposts
  #1-Браузер выдает запрос на URL /users.
  #2-  Rails.application.routes.draw do 
  #направляет /users к действию index в контроллере Users.
  # =>   Rails.application.routes.draw do 
  #     Users_Controller.rb :user metod 
  #def index
  #  @users = User.all
  #end


 #               root 'users#index' 
  #     Users_Controller.rb  metod  :users
  resources :users
#  root 'users#index'



  #root 'application#hello'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
