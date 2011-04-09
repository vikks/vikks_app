class AlterPosts < ActiveRecord::Migration
  def self.up
   rename_table :posts, :blog_posts
   
    change_column :blog_posts, :author, :integer, :default => 0, :null => false
    rename_column :blog_posts, :author, :author_id
    add_index :blog_posts, :author_id    
  end

  def self.down
    remove_index :blog_posts, :author_id
    rename_table :blog_posts, :posts
   
    rename_column :posts, :author_id, :author
    change_column :posts, :author, :string, :limit  =>  100,    :default => 0,  :null => false
    
  end
end
