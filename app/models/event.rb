class Event < ActiveRecord::Base
  include IceCube
  belongs_to :user  
  
  attr_accessible :end_at, :name, :start_at, :recurrence
  has_event_calendar
end
