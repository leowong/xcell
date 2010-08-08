class Comment < ActiveRecord::Base
  belongs_to :post

  attr_accessible :post, :post_id, :name, :email, :site_url, :content

  validates_presence_of :post_id, :name, :content

  named_scope :recent, :order => "created_at"

  before_save :add_protocol_to_site_url

  private

  def add_protocol_to_site_url
    self.site_url = "http://#{site_url}" unless site_url.blank? || site_url.include?('://')
  end
end
