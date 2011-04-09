class RemoveColumnFromPost < ActiveRecord::Migration
  def self.up
      remove_column :blog_posts, :category
  end

  def self.down
      add_column :blog_posts, :category, :string, :limit => 20, :default => "", :null => false
  end
end
