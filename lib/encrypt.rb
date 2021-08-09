require './lib/enigma'

enigma = Enigma.new

message_file = ARGV[0]
encrypted_file = ARGV[1]
key = ARGV[2]
date = ARGV[3]
message = File.open(message_file, "r")

if key.nil? && date.nil?
  encrypt = enigma.encrypt(message.read)
elsif !key.nil? && date.nil?
  encrypt = enigma.encrypt(message.read, key)
elsif !key.nil? && !date.nil?
  encrypt = enigma.encrypt(message.read, key, date)
end

File.new(encrypted_file, 'w').write(encrypt[:encryption])

puts "Created #{encrypted_file} with the key #{encrypt[:key]} and date #{encrypt[:date]}"
