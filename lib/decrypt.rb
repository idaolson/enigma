require './lib/enigma'

enigma = Enigma.new

encrypted_file = ARGV[0]
decrypted_file = ARGV[1]
key = ARGV[2]
date = ARGV[3]
ciphertext = File.open(encrypted_file, "r")

if key.nil? && date.nil?
  decrypt = enigma.decrypt(ciphertext.read)
elsif !key.nil? && date.nil?
  decrypt = enigma.decrypt(ciphertext.read, key)
elsif !key.nil? && !date.nil?
  decrypt = enigma.decrypt(ciphertext.read, key, date)
end

File.new(decrypted_file, 'w').write(decrypt[:decryption])

puts "Created #{decrypted_file} with the key #{decrypt[:key]} and date #{decrypt[:date]}"
