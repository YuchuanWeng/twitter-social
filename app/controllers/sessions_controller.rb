class SessionsController < ApplicationController
 def new

 end

 def create
   user = User.find_by  username: params[:username]
   if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome!"
      redirect_to timeline_path
   else
      flash.now[:error] = "There is something wrong with your username or password"
      render :new
   end

 end

 def destroy
   session[:user_id] = nil
   flash[:notice] = 'Logged out'
   redirect_to root_path
 end

end
