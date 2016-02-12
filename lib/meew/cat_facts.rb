require 'httparty'

module CatFacts
  def self.get
    res = HTTParty.get("http://catfacts-api.appspot.com/api/facts", format: :json)
    res.parsed_response["facts"].first
  end
end
