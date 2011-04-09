class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string  :username,                                 :limit => 100,  :default  =>  "", :null  =>  false
      t.string  :hashed_password,                 :limit => 40,   :null  =>  false
      t.string  :first_name,                             :limit => 25,  :default  => "" ,   :null =>  false
      t.string  :last_name,                              :limit =>20,   :default => "",   :null =>  false
      t.string :email,                                        :limit => 50, :deault =>"", :null => false
      t.string :display_name,                         :limit =>25, :default => "", :null => false
      t.integer :user_level,                             :limit => 3, :delfault => 0, :null => false
    
      t.timestamps
    end
    #disable for production migration
    #User.create(:username => 'vikas', :hashed_password => #'mypassword', :first_name => 'Vikas', :last_name => 'R', :email =>' abc@abc.com', :display_name => 'Vikks', :user_level => 9)
     
  end

  def self.down
    drop_table :users
  end
end
