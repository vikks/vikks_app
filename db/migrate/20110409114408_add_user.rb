class AddUser < ActiveRecord::Migration
  def self.up
          User.create(:username => 'vikas', :hashed_password => 'mypassword', :first_name => 'Vikas', :last_name => 'R', :email =>' abc@abc.com', :display_name => 'Vikks', :user_level => 9)
  end

  def self.down
  end
end
