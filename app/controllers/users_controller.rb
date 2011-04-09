class UsersController < ApplicationController
  
  layout "staff"
  before_filter :authorize_access
  
 # verify :method => :post, :only => [ :destroy, :create, :update ]
#    #     :redirect_to => {  :action => :index }
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.all
#i  commented out this below respond to part, because i was getting double render error when i created a new user in users/manage page.
     # respond_to do |format|
   #   format.html # index.html.erb
     # format.xml  { render :xml => @users }
   # end
  end

			# GET /users/1
			# GET /users/1.xml
		 # def show
		 #@user = User.find(params[:id])
		 # respond_to do |format|
		 #    format.html render( :template => 'users/index')
			 #format.xml  { render :xml => @user }
			# end
		 #end

  # GET /users/new
  # GET /users/new.xml
  def manage
        index
        if request.get? && params[:id].blank? #new
           @user = User.new
        elsif request.post? && params[:id].blank? #create   
           @user = User.new(params[:user])
            if  @user.save
              flash[:notice] = 'User was successfully created.'
              redirect_to :action => 'index'
            else
             render :action => 'manage'
            end
        elsif request.get? && !params[:id].blank? #edit
            @user = User.find(params[:id])
        elsif request.post? && !params[:id].blank? #update or delete
            if params[:commit] == 'Edit'
                @user = User.find(params[:id])
                if @user.update_attributes(params[:user])
                    flash[:notice] = 'User was successfully updated'
                    redirect_to :action => 'index'
                else
                    render :action => 'edit'
                end
            else # action should delete
                #User.find(params[:id]).destroy
                #flash[:notice] = 'User was succcessfully deleted.'
                #redirect_to :action => 'index'
            end
        end
  end
  
     def destroy
           User.find(params[:id]).destroy
            flash[:notice] = 'User was succcessfully deleted.'
            redirect_to :action => 'index'
   end
end
