class AddSummaryToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :summary, :text
  end

  def self.down
    remove_column :posts, :summary
  end
end
