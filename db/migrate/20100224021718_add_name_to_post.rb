class AddNameToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :name, :string
    Post.all.each { |p| p.update_attribute(:name, 'unset') }
  end

  def self.down
    remove_column :posts, :name
  end
end
