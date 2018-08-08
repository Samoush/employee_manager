require 'lib/clients/lohn_manager.rb'
require 'lib/parsers/lohn_manager.rb'

class LohnManager
  def update_employers
    response = Clients::LohnManager.get_employers
    parsed_response = Parsers::LohnManager.parse(response)

    persist_employers!(parsed_response)
  end

  def persist_employers!

  end
    
end