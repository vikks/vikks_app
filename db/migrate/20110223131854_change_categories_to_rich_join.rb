class ChangeCategoriesToRichJoin < ActiveRecord::Migration
  def self.up
      add_column :categories_posts, :id, :primary_key
  end

  def self.down
      remove_column :categories_posts, :id
  end
end
