require 'httparty'

module TechNews
  def self.get
    res = HTTParty.get("http://feeds.bbci.co.uk/news/technology/rss.xml",
                      format: :xml)
    item = res.parsed_response["rss"]["channel"]["item"].first
    "#{item["title"]}\n#{item["description"]}"
  end
end
