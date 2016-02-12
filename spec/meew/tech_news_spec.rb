require "webmock/rspec"
require "meew/tech_news"

RSpec.describe TechNews, "#get" do
  let(:uri) { "http://feeds.bbci.co.uk/news/technology/rss.xml" }
  let(:fixture) { File.dirname(__FILE__) + "/../fixtures/bbcnews_tech.xml" }
  before { stub_request(:get, uri).to_return(body: File.read(fixture)) }

  it "gets the first tech news title from BBC News" do
    expected = "VTech 'is responsible' for kids' data\nThe UK's data privacy watchdog confirms that VTech remains responsible for protecting users' data despite changes to its terms and conditions."
    expect(TechNews.get).to eq(expected)
  end

end
