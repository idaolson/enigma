require './lib/cipherable'

class Enigma
  include Cipherable

  def encrypt(message, key, date = today)
    encrypt_hash = {
      encryption: shift(message.downcase.split(''), key, date),
      key: key,
      date: date
    }
  end

  def decrypt(code, key = nil, date = today)
    encrypt_hash = {
      encryption: unshift(code.downcase.split(''), key, date),
      key: key,
      date: date
    }
  end
end
