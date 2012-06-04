class User < ActiveRecord::Base
  attr_accessible :facebook_id, :location_id, :location_name, :gender, :timezone, :locale, :birthday, :friend_of

  validates_uniqueness_of :facebook_id
end
