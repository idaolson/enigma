require './lib/enigma'

# ARGV == ["message.txt", "encrypted.txt"]
# ARGV[0] == "message.txt"
# ARGV[1] == "encrypted.txt"
# ARGV[2] == key
# ARGV[3] == date
enigma = Enigma.new

message_file = ARGV[0]
encrypted_file = ARGV[1]
message = File.open(message_file, "r")

if ARGV[2].nil? && ARGV[3].nil?
  encrypt = enigma.encrypt(message.read)
elsif !ARGV[2].nil? && ARGV[3].nil?
  encrypt = enigma.encrypt(message.read, ARGV[2])
elsif !ARGV[2].nil? && !ARGV[3].nil?
  encrypt = enigma.encrypt(message.read, ARGV[2], ARGV[3])
end

File.new(encrypted_file, 'w').write(encrypt[:encryption])

puts "Created #{encrypted_file} with the key #{encrypt[:key]} and date #{encrypt[:date]}"
