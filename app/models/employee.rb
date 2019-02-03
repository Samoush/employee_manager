require 'active_record'

class Employee < ActiveRecord::Base
  has_many :orders

  validates_presence_of :firstname, :lastname, :employee_no,
                        :lohn_manager_id, :email
end
