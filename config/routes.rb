SimpleBlog::Application.routes.draw do

  get "comments/set_status"
   
  get "comments/index"
   
  get "comments/list"
   
  get "comments/show"
   
  get "users/index"
     
  get "users/manage"
  
  get "users/destroy"
 
  get "staff/index"

  get "staff/login"

  get "staff/menu"

  get "staff/logout"

  get "main/index"

  get "main/list"

  get "main/category"

  get "main/archive"

  get "main/view_post"
  
  get "posts/index"
 
  get "posts/show"
 
  get "posts/update"
 
  get "posts/create"
 
  get "posts/edit"
 
  get "posts/destroy"
 
  get "posts/new"
  
  get "categories/destroy"
 
  
   resources :posts
   resources :users
   resources :categories   #only create link will work with this but not edit and destroy links...
   resources :comments
   resources :main
    
    #with resources :categories commented out this will enableedit and destroy links in the categories page.
    #but the create link will produce error ID= Create ...;    
   match 'categories(/:id)' => 'categories#update'   # if both resources and match are enabled, then evrything works exept for destroy link...
   
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
    root :to => "main#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id(.:format)))'
end
