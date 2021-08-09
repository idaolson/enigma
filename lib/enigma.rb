require './lib/cipherable'

class Enigma
  include Cipherable

  def encrypt(message, key, date = today)
    encrypt_hash = {
      encryption: letter_index(message, shift(key, date)),
      key: key,
      date: date
    }
  end

  def decrypt(code, key = nil, date = today)
    encrypt_hash = {
      encryption: letter_index(code, shift(key, date)),
      key: key,
      date: date
    }
  end
end
