require './lib/enigma'

# ARGV == ["encrypted.txt", "decrypted.txt"]
# ARGV[0] == "encrypted.txt"
# ARGV[1] == "decrypted.txt"
# ARGV[2] == key
# ARGV[3] == date
enigma = Enigma.new

encrypted_file = ARGV[0]
decrypted_file = ARGV[1]
ciphertext = File.open(encrypted_file, "r")

if ARGV[2].nil? && ARGV[3].nil?
  decrypt = enigma.decrypt(ciphertext.read)
elsif !ARGV[2].nil? && ARGV[3].nil?
  decrypt = enigma.decrypt(ciphertext.read, ARGV[2])
elsif !ARGV[2].nil? && !ARGV[3].nil?
  decrypt = enigma.decrypt(ciphertext.read, ARGV[2], ARGV[3])
end

File.new(decrypted_file, 'w').write(decrypt[:decryption])

puts "Created #{decrypted_file} with the key #{decrypt[:key]} and date #{decrypt[:date]}"
