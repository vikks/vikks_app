SimpleBlog::Application.routes.draw do
 
   get "comments/set_status"
   get "comments/index"
   get "comments/list"
   get "comments/show"
   
 
  match 'users/manage/:id' => 'users#manage'
 
   resources :users
  

   resources :categories
   resources :comments
   resources :main
    

 # resources :blog_posts
 #---------------------------------------------
  resources :posts
  match 'posts/:id' => 'posts#update'

 match 'comments/set_status' =>  'comments#set_status'
 match 'comments/show/:id' => 'comments#show'

  match 'main/view_post/:id'  => 'main#view_post'
  match 'main/add_comment/:id'  => 'shared#view_post'
  
  match 'posts/show' => 'posts#update'
 
  match 'categories/:id' => 'categories#update'
  connect 'categories/:action' =>  "categories#{index}"
  match 'users/manage/:id' => 'users#manage'
 get "users/index"
  #get "users/show"
 get "users/manage"
  
 #  get "users/new"
  match 'users/show' => 'users#manage' 
    # match 'users/index' => 'users#manage' 
    #  match 'users/manage' => 'users#index' 
    

 
  #-----------------------------------------------
  get "staff/index"

  get "staff/login"

  get "staff/menu"

  get "staff/logout"

  get "main/index"

  get "main/list"

  get "main/category"

  get "main/archive"

  get "main/view_post"
  
  #--------------------------------------------

  #----------------------------------------

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
end
