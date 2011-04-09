class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string  :title,  :limit => 100,  :default  =>  "", :null  =>  false
      t.text     :content,                                                   :null  =>  false
      t.string  :author, :limit => 100,  :default  => 0,   :null =>  false
      t.string  :category, :limit =>20,   :default => "",   :null =>  false
      t.string  :status,  :limit  =>20,  :default => "",   :null =>  false
       
  
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
