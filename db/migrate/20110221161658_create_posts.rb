class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :blog_posts do |t|
      t.string  :title,  :limit => 100,  :default  =>  "", :null  =>  false
      t.text     :content,                                                   :null  =>  false
      t.string  :author_id, :integer, :default => 0, :null => false
      t.string  :category, :limit =>20,   :default => "",   :null =>  false
      t.string  :status,  :limit  =>20,  :default => "",   :null =>  false
       
  
      t.timestamps
    end
  end

  def self.down
    drop_table :blog_posts
  end
end
