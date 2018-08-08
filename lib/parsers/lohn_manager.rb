require 'json'

module Parsers
  class LohnManager
    def parse(response)
    	JSON.parse(response, symbolize_names: true)
    end
    
  end
end