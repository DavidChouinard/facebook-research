class Comment < ActiveRecord::Base
  attr_accessible :message, :facebook_created_at, :facebook_id, :from, :likes, :to

  validates_uniqueness_of :facebook_id

  #belongs_to :message
end
