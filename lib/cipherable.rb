module Cipherable
  extend self

  def character_set
    @character_set = ("a".."z") << " "
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

  def shift(message, key, date)
    key_array = calc_key(key)
    offset_array = calc_offset(date)
    (0..3).map do |num|
      (key_array[num] + offset_array[num]) % 27
    end
  end

  def unshift(code, key, date)
  end

  def today
    Date.today.strftime('%d%m%y')
  end
end
