require 'active_record'

class Employer < ActiveRecord::Base
  validates_presence_of :name, :address, :contact_person,
                        :telephone, :email, :website, :night_addition_in_percent, :sunday_addition_in_percent, :holiday_addition_in_percent
end
