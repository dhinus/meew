require 'httparty'

module CatImages
  def self.get
    res = HTTParty.get("http://thecatapi.com/api/images/get?format=xml")
    res.parsed_response["response"]["data"]["images"]["image"]["url"]
  end
end
