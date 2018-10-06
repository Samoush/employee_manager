require 'json'

module Parsers
  class LohnManager
    def self.parse(response)
    	JSON.parse(response, symbolize_names: true)[:GetAllEmployeesResult]
    end
    
  end
end
