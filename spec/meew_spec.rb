require "meew"

RSpec.describe Meew, "#run" do
  context "when no command is specified" do
    it "shows usage information" do
      expect { Meew.run([]) }.
        to output(/Usage: meew \[command\]/).to_stdout
    end
  end

  context "when an invalid command is specified" do
    it "shows usage information" do
      expect { Meew.run(["dog"]) }.
        to output(/Usage: meew \[command\]/).to_stdout
    end
  end

  context "the 'browser' command" do
    let(:fake_image) { "http://example.cat/img.jpg" }
    before do
      allow(CatImages).to receive(:get) { fake_image }
      expect(Meew).to receive(:system).with("open #{fake_image}")
    end

    it "opens an image of a cat" do
      Meew.run(["browser"])
    end
  end

  context "the 'file' command" do
    it "shows 'not implemented'" do
      expect { Meew.run(["file"]) }.
        to output(/This command is not implemented yet/).to_stdout
    end
  end

  context "the 'fact' command" do
    it "shows 'not implemented'" do
      expect { Meew.run(["fact"]) }.
        to output(/This command is not implemented yet/).to_stdout
    end
  end
end
