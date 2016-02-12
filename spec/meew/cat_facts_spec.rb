require "webmock/rspec"
require "meew/cat_facts"

RSpec.describe CatFacts, "#get" do
  let(:uri) { "http://catfacts-api.appspot.com/api/facts" }
  let(:fixture) { File.dirname(__FILE__) + "/../fixtures/catfacts.json" }
  before { stub_request(:get, uri).to_return(
    status: 200,
    body: File.read(fixture)
  ) }

  it "gets a cat fact from the catfacts-api" do
    expected = "Some notable people who disliked cats:  " \
               "Napoleon Bonaparte, Dwight D. Eisenhower, Hitler."
    expect(CatFacts.get).to eq(expected)
  end
end
