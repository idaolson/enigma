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
      expect(enigma.calc_offset("040895")).to eq([1, 0, 2, 5])
    end

    it "can create an array of shifts" do
      expect(enigma.shift("02715", "040895")).to eq([3, 27, 73, 20])
    end

    it "can shift letters using cipher, ignore symbols, and return new string" do
      expect(enigma.letter_index("hello world!", [3, 27, 73, 20])).to eq("keder ohulw!")
    end

    it "can generate today's date" do
      expect(enigma.today).to eq("090821")
    end

    it "can generate a random number string of 5 digits with 0s padding" do
      expect(random_key.length).to eq(5)
      expect(random_key.class).to eq(String)
    end
  end
end
