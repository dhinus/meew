require "webmock/rspec"
require "meew/cat_images"

RSpec.describe CatImages, "#get" do
  let(:uri) { "http://thecatapi.com/api/images/get?format=xml" }
  let(:fixture) { File.dirname(__FILE__) + "/../fixtures/thecatapi.xml" }
  before { stub_request(:get, uri).to_return(
    status: 200,
    body: File.read(fixture),
    headers: { "Content-Type" => "text/xml" }
  ) }

  it "gets a cat image from thecatapi.com" do
    expected = "http://25.media.tumblr.com/tumblr_lw63keBwD81qk10i8o1_500.gif"
    expect(CatImages.get).to eq(expected)
  end
end
