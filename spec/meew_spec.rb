require 'meew'

RSpec.describe Meew, "#run" do
  it "outputs Meeeeew!" do
    expect{ Meew.run }.
      to output(/Meeeeew!/).to_stdout
  end
end
