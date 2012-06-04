class Annotation < ActiveRecord::Base
  attr_accessible :facebook_name, :facebook_id, :month, :year, :day

  #validates_numericality_of :day, :on => :create, :only_integer => true, :greater_than => 0, :less_than_or_equal_to => 31
  #validates_numericality_of :month, :on => :create, :only_integer => true, :greater_than => 0, :less_than_or_equal_to => 12
  #validates_numericality_of :year, :on => :create, :only_integer => true, :greater_than => 0
end
