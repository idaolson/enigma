require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  enigma = Enigma.new

  it "exists" do
    expect(enigma).to be_an(Enigma)
  end

  it "encrypts" do
    encrypted = {encryption: "keder ohulw", key: "02715", date: "040895"}
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(encrypted)
  end

  it "decrypts" do
    decrypted = {decryption: "hello world", key: "02715", date: "040895"}
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(decrypted)
  end

  it "encrypts with today's date" do
    encrypted = enigma.encrypt("hello world", "02715")
    expect(encrypted).to eq({ encryption: "nefau qdxly", key: "02715", date: Date.today.strftime("%d%m%y") })
  end

  it "decrypts with today's date" do
    encrypted = enigma.decrypt("nefau qdxly", "02715")
    expect(encrypted).to eq({ decryption: "hello world", key: "02715", date: Date.today.strftime('%d%m%y') })
  end
end
