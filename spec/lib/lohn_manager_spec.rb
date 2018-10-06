require 'spec_helper'
require [Dir.pwd, 'lib', 'lohn_manager'].join('/')
require [Dir.pwd, 'app', 'models', 'employee'].join('/')

#FIXME requiring und establish connection in initializers legen oder Rails konfigurieren
connection_info = YAML.load_file("config/database.yml")["test"].except('pool', 'socket').merge(host:'localhost')
ActiveRecord::Base.establish_connection(connection_info)

RSpec.describe LohnManager, type: :model do
  describe '#update_employees' do
    context 'when trigger request to get all empolyers' do
    	before { described_class.update_employees }
      subject(:first_employee) { Employee.first }

      describe 'persists employees' do
        it do
          expect(Employee.all.count).to be_an(Numeric)
          expect(first_employee.email).not_to be_empty
          expect(first_employee.employee_no).to be_an(Numeric)
          expect(first_employee.firstname).not_to be_empty
          expect(first_employee.lastname).not_to be_empty
          expect(first_employee.lohn_manager_id).to be_an(Numeric)
        end
      end
    end
  end
end
