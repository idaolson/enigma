module Cipherable
  extend self

  def character_set
    character_set = ('a'..'z').to_a << ' '
  end

  def calc_key(key)
    key.split('').each_cons(2).map do |pair|
      pair.join.to_i
    end
  end

  def calc_offset(date)
    (date.to_i ** 2).to_s.split('')[-4..-1].map do |digit|
      digit.to_i
    end
  end

  def shift(key, date)
    key_array = calc_key(key)
    offset_array = calc_offset(date)
    (0..3).map do |num|
      (key_array[num] + offset_array[num])
    end
  end

  def letter_index(message, shift_array)
    message = message.downcase.split('')
    letter_array = []
    message.length.times do |i|
      if character_set.index(message[i]).nil?
        letter_array << message[i]
      else letter_array << character_set[(character_set.index(message[i]) + shift_array[i % 4]) % 27]
      end
    end
    letter_array.join
  end

  def today
    Date.today.strftime('%d%m%y')
  end
end
