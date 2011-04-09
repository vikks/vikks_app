class StaffController < ApplicationController
 
 layout "staff"
 before_filter :authorize_access, :except => [:index, :login, :send_login] 
   
   
   
  def index
      login
      render(:action => 'login')
  end

  def login
     # @user = User.new
  end

  def send_login
     # @user = User.new(params[:user])         #This type creates  a user object 
     # logged_in_user = @user.try_to_login   #each time someone  tries to login,an user object is created, but below type won't  create a user object if login fails
      found_user = User.authenticate(params[:username], params[:password])
      if found_user
          session[:user_id] = found_user.id
          flash[:notice] = "You are now logged in"
          redirect_to(:action => 'menu'  )
      else
          flash[:notice] = "Username/password combination incorrect. Please make sure caps lock  key is off and try again"
          render(:action => 'login')
      end
  end
     
 
  def menu
      #just text
  end

  def logout
      session[:user_id]= nil
      flash[:notice] = "You are now logged out."
      redirect_to(:action => 'login')
  end

end
