class Comment < ActiveRecord::Base
  attr_accessible :post_id, :name, :email, :site_url, :content
end
