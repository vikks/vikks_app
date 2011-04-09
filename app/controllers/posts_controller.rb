class PostsController < ApplicationController
  
#  verify :method => :post, :only => [ :destroy, :create, :update ],
#             :redirect_to => {  :action => :index }
  
    layout "staff"
    before_filter :authorize_access
    
    
  # GET /posts
  # GET /posts.xml
  def index
     @posts = Post.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end
 #---this method added from rail beyond-------- 
  def list
    @post_pages, @posts = paginate :posts, :per_page =>10
  end
 #--------------------------------------------------------------------
  # GET /posts/1
  # GET /posts/1.xml
  def show
    #this action willl preview the public view of the post
    @post = Post.find(params[:id])
    @all_categories = Category.find(:all, :order =>' name ASC'   )
    
    respond_to do |format|
      format.html {render(:template =>'shared/view_post', :layout => 'application'    )}
      format.xml  { render :xml => @post }
    end
  end
  
   alias :view_post  :show  #from rails beyond

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
    @user_list = get_user_list 
    @all_categories = get_all_categories
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @user_list = get_user_list
    @all_categories = get_all_categories
  end

  # POST /posts
  # POST /posts.xml
  def create
    post_params = params[:post]
    author_id = post_params.delete(:author_id)
    @all_categories = get_all_categories
    checked_categories = get_categories_from(params[:categories])
    removed_categories = @all_categories -  checked_categories
    @post = Post.new(post_params)
    @post.author = User.find(author_id)
    
    respond_to do |format|
      if  @post.save
        checked_categories.each { |cat| @post.categories << cat if !@post.categories.include?(cat)  }
        removed_categories.each { |cat| @post.categories.delete(cat) if @post.categories.include?(cat)  }
        format.html { redirect_to(@post, :notice => 'Post was successfully created. ') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
         @user_list = get_user_list
         
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
 end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    post_params = params[:post]
    author_id = post_params.delete(:author_id)
     @all_categories = get_all_categories
    checked_categories = get_categories_from(params[:categories])
    removed_categories = @all_categories -  checked_categories
    @post = Post.find(params[:id])
    @post.author = User.find(author_id) if @post.author_id != author_id

    respond_to do |format|
      if @post.update_attributes(post_params)
       checked_categories.each { |cat| @post.categories << cat if !@post.categories.include?(cat)  }
        removed_categories.each { |cat| @post.categories.delete(cat) if @post.categories.include?(cat)  }
        format.html { redirect_to(@post, :notice => 'Blog post was successfully updated.') }
        format.xml  { head :ok }
      else
         
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
  
  
  private #-----------------------------------------
  
  def get_user_list
     return  User.find(:all, :order => 'last_name ASC').collect { |user| [user.full_name, user.id] }
  end 
  
  def get_all_categories
    return Category.find(:all, :order => 'name ASC')
  end
  
  def get_categories_from(cat_list)
    cat_list = [] if cat_list.blank?
    return cat_list.collect { |cid|  Category.find_by_id(cid.to_i)}.compact
  end

end
