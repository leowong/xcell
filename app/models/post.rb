class Post < ActiveRecord::Base
  attr_accessible :title, :summary, :content, :published_at

  named_scope :published, lambda { {:conditions => ['published_at <= ?', Time.zone.now]} }
  named_scope :recent, :order => 'published_at DESC'

  validates_presence_of :title, :summary, :content, :published_at

  def updated?
    updated_at.to_date > published_at.to_date
  end

  def published?
    published_at <= Time.zone.now
  end

  def status
    published? ? "published" : "unpublished"
  end

  def body
    summary + content
  end
end
