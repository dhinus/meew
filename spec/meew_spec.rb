require "meew"
require "fakefs/spec_helpers"

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

  context "the 'fact' command" do
      before { allow(CatFacts).to receive(:get) { "A random cat fact" } }

      it "displays a random cat fact" do
        expect { Meew.run(["fact"]) }.
          to output("A random cat fact\n").to_stdout
    end
  end

  context "the 'file' command" do
    include FakeFS::SpecHelpers

    let(:fake_jpg) { "http://example.cat/img.jpg" }
    let(:fake_gif) { "http://example.cat/img.gif" }
    before do
      allow($stdout).to receive(:puts)
      allow($stderr).to receive(:puts)
      allow(Meew).to receive(:open) { StringIO.new("a new cat") }
    end

    it "saves an image of a cat in ~/Desktop" do
      allow(CatImages).to receive(:get) { fake_jpg }

      FakeFS do
        Meew.run(["file"])
        file_path = File.expand_path("~/Desktop/cat.jpg")
        expect(File).to exist(file_path)
      end
    end

    it "detects the file extension" do
      allow(CatImages).to receive(:get) { fake_gif }

      FakeFS do
        Meew.run(["file"])
        file_path = File.expand_path("~/Desktop/cat.gif")
        expect(File).to exist(file_path)
      end
    end

    it "shouldn't overwrite an existing file" do
      allow(CatImages).to receive(:get) { fake_jpg }

      FakeFS do
        file_path = File.expand_path("~/Desktop/cat.jpg")

        FileUtils.mkdir_p(File.dirname(file_path))
        File.open(file_path, 'w') { |file| file.write("existing cat") }

        expect { Meew.run(["file"]) }.to raise_error(SystemExit)
        expect(File.read(file_path)).to eq("existing cat")
      end
    end
  end
end
