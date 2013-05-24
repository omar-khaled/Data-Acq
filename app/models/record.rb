class Record < ActiveRecord::Base
  attr_accessible :time, :comment, :value
  validates :value, :presence => true
  validates :comment, :presence => true
end


