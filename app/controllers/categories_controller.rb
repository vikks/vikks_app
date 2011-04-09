class CategoriesController < ApplicationController
  
  layout "staff"
  before_filter :authorize_access
  
#  verify :method => :post, :only => [ :destroy, :create ,:update ],
#            :redirect_to => {:action => :index  }

  def list
   # @category_pages, @categories = paginate :categories, :per_page =>10    
    @categories = Category.all  
  end

  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.all    
    @category    = Category.find(params[:id])  if params[:id]
    @category    = Category.new if @category.nil?

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end
  

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
       # flash[:notice] = 'Category was successfull'
        format.html { redirect_to(:action => 'index', :notice => 'Category was successfully created.') }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end
  #--------------------------------------------------------------------------------------------------------------------------------
  #---I created this show action 'cos i was getting {Unknow  Action Error} error when i clicked edit or create button in the index form----------------------------
                                                                    #----------the action 'show' could not be found in Categories Controller------------------
  #def show
   #     redirect_to :action => "index"
 # end
 
 #----------------------------------------------------------------------------------------------------------------------------------
 
  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(:action => "index" , :notice => 'Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(:action => 'index') }
      format.xml  { head :ok }
    end
  end
end
