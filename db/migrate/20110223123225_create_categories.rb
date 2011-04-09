class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
        t.string :name, :limit => 50, :default => "", :null => false
        t.string :short_name, :limit =>30, :default => "", :null => false
        t.string :description, :default => "", :null => false
                

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
