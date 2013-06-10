class Event < ActiveRecord::Base
  include IceCube
  belongs_to :user, :class_name => "User", :foreign_key => "email"  
  
  attr_accessible :end_at, :name, :start_at, :recurrence, :user_email
  has_event_calendar
    
end
