class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :end_at, :name, :start_at
  has_event_calendar
end
