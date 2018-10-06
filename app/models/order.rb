require 'active_record'

class Order < ActiveRecord::Base
  validates_presence_of :employer, :employee, :start_time,
                        :end_time, :date, :working_hours, :hourly_compensation,
                        :employee_hourly_compensation, :break_in_minutes
end
