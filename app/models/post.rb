class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy

  attr_accessible :title, :name, :summary, :content, :published_at

  named_scope :published, lambda { {:conditions => ['published_at <= ?', Time.zone.now]} }
  named_scope :recent, :order => 'published_at DESC'

  validates_presence_of :title, :name, :summary, :content, :published_at

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

  def to_param
    [id, slug].join('-')
  end

  private

  def slug
    name.downcase.gsub(/[^0-9a-z]+/, ' ').strip.gsub(' ', '-')
  end
end
