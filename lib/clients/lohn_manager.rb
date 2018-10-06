require 'net/http'
require 'json'
require [Dir.pwd, 'lib', 'parsers', 'lohn_manager'].join('/')

module Clients
  class LohnManager
    
    def self.get_employers
      uri = URI('https://api.lohnmanager.info/LohnManagerService.svc/json/GetAllEmployees')
      req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      req.body = request_params
      res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(req)
      end
      
      Parsers::LohnManager.parse(res.body)
    end

    private

    def self.request_params
      {"apiKey": ENV.fetch("LOHNMANAGER_API_KEY"),"companyNo": ENV.fetch("COMPANY_NO")}.to_json
    end
  end
end
