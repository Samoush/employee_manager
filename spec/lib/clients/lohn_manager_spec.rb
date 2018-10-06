require 'spec_helper'
require [Dir.pwd, 'lib', 'clients', 'lohn_manager'].join('/')

RSpec.describe Clients::LohnManager, type: :request do
  describe 'class methods' do
    describe '#get_employers' do
      context 'when trigger request to get all empolyers' do
      	subject(:responded_employees) { described_class.get_employers }

        describe 'returns employees' do
          let(:first_employee) { responded_employees.first }

          it do
            expect(responded_employees).not_to be_empty
            expect(first_employee[:Email]).not_to be_empty
            expect(first_employee[:EmployeeNo]).to be_an(Numeric)
            expect(first_employee[:FirstName]).not_to be_empty
            expect(first_employee[:LastName]).not_to be_empty
            expect(first_employee[:ID]).to be_an(Numeric)
          end
        end
      end
    end
  end
end
