class Post < ActiveRecord::Base
  attr_accessible :title, :summary, :content, :published_at

  named_scope :published, lambda { {:conditions => ['published_at <= ?', Time.zone.now]} }
  named_scope :unpublished, lambda { {:conditions => ['published_at > ?', Time.zone.now]} }
  named_scope :recent, :order => 'published_at DESC'
end
