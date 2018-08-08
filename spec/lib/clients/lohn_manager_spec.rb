require 'spec_helper'
require [Dir.pwd, 'lib', 'clients', 'lohn_manager'].join('/')

RSpec.describe Clients::LohnManager, type: :request do
  describe 'class methods' do
    describe '#get_employers' do
      context 'when trigger request to get all empolyers' do
      	it do 
      		debugger
      	end
      	before { described_class.get_employers }
      end
    end
  end
end
