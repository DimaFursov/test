class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate    
      #user.update_attribute(:activated,    true)
      #user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

=begin
Started GET "/account_activations/z7SPey1DnegylzsljmQs7A/edit?email=qweqweqwe%40qwe.qwe" for 127.0.0.1 at 2020-06-16 20:42:53 +0300
Processing by AccountActivationsController#edit as HTML
  Parameters: {"email"=>"qweqweqwe@qwe.qwe", "id"=>"z7SPey1DnegylzsljmQs7A"}
  User Load (0.2ms)  SELECT  "users".* FROM "users" WHERE "users"."email" = ? LIMIT 1  [["email", "qweqweqwe@qwe.qwe"]]
Redirected to http://localhost:3000/
Completed 302 Found in 67ms (ActiveRecord: 0.9ms)
=end 
=begin
#активация не работает по ссылке Invalid activation link 
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:activated,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
end
=end  
end