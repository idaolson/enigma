require 'spec_helper'
require './lib/enigma'

RSpec.describe Cipherable do
  include Cipherable
  context "#initialize" do
    enigma = Enigma.new

    it "can create array of keys" do
      expect(enigma.calc_key("02715")).to eq([2, 27, 71, 15])
    end

    it "can create an array of offsets" do
      expect(enigma.calc_offset('040895')).to eq([1, 0, 2, 5])
    end

    it "can create an array of shifts" do
      expect(enigma.shift("hello world", "02715", "040895")).to eq([3, 0, 19, 20])
    end

    it "can generate today's date" do
      expect(enigma.today).to eq("090821")
    end
  end
end
