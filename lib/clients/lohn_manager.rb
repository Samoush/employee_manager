require 'net/http'
require 'json'

module Clients
  class LohnManager
    
    def self.get_employers
      uri = URI('https://api.lohnmanager.info/LohnManagerService.svc/json/GetAllEmployees')
      req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      req.body = request_params
      #debugger
      res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(req)
      end
      debugger
    end

    private

    def self.request_params
      {"apiKey": "I1VYrcmTnpsxiphlntfJVZeni3Shj2wWIDTHvgmNU9GKFUCSjOGoIbhin7gXUF9Us6of69qGH1pmS3iX","companyNo": 3029}.to_json
    end
  end
end