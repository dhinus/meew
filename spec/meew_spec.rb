require 'meew'

RSpec.describe Meew, "#run" do
  context "if no command is specified" do
    it "shows usage information" do
      expect { Meew.run([]) }.
        to output(/Usage: meew \[command\]/).to_stdout
    end
  end

  context "if an invalid command is specified" do
    it "shows usage information" do
      expect { Meew.run(["dog"]) }.
        to output(/Usage: meew \[command\]/).to_stdout
    end
  end

  context "'browser' command" do
    it "shows 'not implemented'" do
      expect { Meew.run(["browser"]) }.
        to output(/This command is not implemented yet/).to_stdout
    end
  end

  context "'file' command" do
    it "shows 'not implemented'" do
      expect { Meew.run(["browser"]) }.
        to output(/This command is not implemented yet/).to_stdout
    end
  end

  context "'fact' command" do
    it "shows 'not implemented'" do
      expect { Meew.run(["browser"]) }.
        to output(/This command is not implemented yet/).to_stdout
    end
  end
end
