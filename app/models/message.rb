class Message < ActiveRecord::Base
  attr_accessible :facebook_id, :tag_count, :like_count, :comment_count, :content, :from, :to, :post_type, :facebook_created_time, :facebook_updated_time, :recipient_is_tagged, :comments_attributes, :application_name, :has_link, :has_video, :has_with_tag, :has_place

  validates_uniqueness_of :facebook_id

  has_many :comments
  accepts_nested_attributes_for :comments
end
