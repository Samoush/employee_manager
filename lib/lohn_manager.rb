require [Dir.pwd, 'lib', 'clients', 'lohn_manager'].join('/')
require [Dir.pwd, 'app', 'models', 'employee'].join('/')

class LohnManager
  def self.update_employees
    parsed_employees = Clients::LohnManager.get_employers

    persist_employers(parsed_employees)
  end

  def self.persist_employers(employees)
    employees.each do |employee|
      Employee.create!(
        firstname: employee[:FirstName],
        lastname: employee[:LastName],
        email: employee[:Email],
        employee_no: employee[:EmployeeNo],
        lohn_manager_id: employee[:ID]
      )
    end
  end
end
