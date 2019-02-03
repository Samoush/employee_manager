require 'active_record'

class Order < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employer

  validates_presence_of :employer, :employee, :start_time,
                        :end_time, :date, :working_hours, :hourly_compensation,
                        :employee_hourly_compensation, :break_in_minutes

  def employer_name
    employer.name
  end

  def employee_fullname
    employee.firstname + " " +  employee.lastname
  end

  def formatted_start_time
    start_time.strftime("%H:%M")
  end

  def formatted_end_time
    end_time.strftime("%H:%M")
  end

  def formatted_date
    date.strftime("%d.%m.%Y")
  end

  def formatted_hourly_compensation
    '%.2f' % hourly_compensation
  end

  def formatted_employee_hourly_compensation
    '%.2f' % employee_hourly_compensation
  end
end
