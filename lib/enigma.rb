require './lib/cipherable'
require 'date'

class Enigma
  include Cipherable

  def encrypt(message, key = random_key, date = today)
    encrypt_hash = {
      encryption: letter_index(message, shift(key, date)),
      key: key,
      date: date
    }
  end

  def decrypt(ciphertext, key = random_key, date = today)
    neg_shift = shift(key, date).map do |num|
      num * -1
    end

    decrypt_hash = {
      decryption: letter_index(ciphertext, neg_shift(key, date)),
      key: key,
      date: date
    }
  end
end
