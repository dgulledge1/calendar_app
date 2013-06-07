class Event < ActiveRecord::Base
  include IceCube
  belongs_to :user  
  
  attr_accessible :end_at, :name, :start_at, :recurrence
  has_event_calendar
  
  def schedule
    new_schedule = Schedule.new(start_at)
    new_schedule.add_reccurence_rule(Rule.daily)
    new_schedule.add_recurrence_rule(Rule.terminating?(:end_at))    
    new_schedule.add_exception_time(:saturday)
    new_schedule.add_exception_time(:sunday)
    new_schedule
  end
end
