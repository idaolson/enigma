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

  def decrypt(message, key = nil, date = today)
    neg_shift = shift(key, date).map do |num|
      num * -1
    end

    decrypt_hash = {
      decryption: letter_index(message, neg_shift),
      key: key,
      date: date
    }
  end
end
