require [Dir.pwd, 'app', 'models', 'employer'].join('/')
require 'spec_helper'

#FIXME requiring und establish connection in initializers legen oder Rails konfigurieren
connection_info = YAML.load_file("config/database.yml")["test"].except('pool', 'socket').merge(host:'localhost')
ActiveRecord::Base.establish_connection(connection_info)

RSpec.describe Employer, type: :model do
  describe 'relationships' do

  end

  let(:valid_create_atrributes) {
    {
      name: 'Elderly Care GmbH',
      address: 'Mozartstr. 32',
      contact_person: 'John Doe',
      telephone: '0143 94438939',
      email: 'john@doe.de',
      website: 'elderlycare.de',
      night_addition_in_percent: 15,
      sunday_addition_in_percent: 20,
      holiday_addition_in_percent: 25
    }
  }

  describe 'validation' do
    context 'when Employer is valid' do
      it do
        expect(Employer.new(
          valid_create_atrributes
        )). to be_valid
      end
    end

    context 'when Employer is invalid' do
      [:name,:address,:contact_person,:telephone,:email,:website,:night_addition_in_percent,:sunday_addition_in_percent,
      :holiday_addition_in_percent].each do |missing_attribute|
        context "when #{missing_attribute} is missing" do
          it do
            expect(Employer.new(
              valid_create_atrributes.except(missing_attribute)
            )). to be_invalid
          end
        end
      end 
    end
  end
end
